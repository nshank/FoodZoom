class LocationsController < ApplicationController
  
  def index
    #PASSES DATES TO SCOPE
    @locations = Location.date_filter(Date.today.beginning_of_day, Date.today.end_of_day)
    
    @trucks = Truck.all
    
    # GET TRUCKS FOR GOOGLE MAPS
    @json = Location.date_filter(Date.today.beginning_of_day, Date.today.end_of_day).to_gmaps4rails
  end
  
  def date_select
    @locations = Location.date_filter(Date.today.beginning_of_day, Date.today.end_of_day).to_gmap4rails
  end
  
  def new
    @location = Location.new
    @trucks = Truck.all
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