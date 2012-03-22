class LocationsController < ApplicationController
  
  def index
    @trucks = Truck.all

     # GET TRUCKS FOR GOOGLE MAPS
     
    if params[:date]
      @json = Location.date_filter(:date).to_gmaps4rails do |location, marker|
             marker.infowindow render_to_string(:partial => "/locations/info_box", :locals => { :location => location})
             marker.sidebar(location.truck.name)
             marker.json({ :id => location.id })
           end
    else
      @json = Location.where("date = ?", Date.today ).to_gmaps4rails do |location, marker|
            marker.infowindow render_to_string(:partial => "/locations/info_box", :locals => { :location => location})
            marker.sidebar(location.truck.name)
            marker.json({ :id => location.id })
          end
    end
  end

  
  def new
    @location = Location.new
    @trucks = Truck.all
  end
  
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end
  
  def create
    @location = Location.new(params[:location])
    
    respond_to do |format|
      if @location.save
        format.html { redirect_to locations_url, notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end
  
end