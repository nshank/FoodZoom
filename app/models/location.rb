class Location < ActiveRecord::Base
  belongs_to :truck
  
  def self.date_filter(begin_date, end_date)
    where("date BETWEEN ? AND ?", begin_date, end_date )
  end

#  scope :date_filter, lambda { where("date BETWEEN ? AND ?", Date.today.beginning_of_day, Date.today.end_of_day ) }
  
  acts_as_gmappable :check_process => false
  
  def gmaps4rails_address
    "#{self.address}, Chicago, IL" 
  end
  
  def gmaps4rails_infowindow
    "#{self.truck.name}"
  end
  
  def gmaps4rails_sidebar
    "<h4>#{self.truck.name}</h4>
      <div class='content'>
        Today @ <span>#{self.address}</span>
      </div>"
  end
  
end
