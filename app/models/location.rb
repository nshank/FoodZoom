class Location < ActiveRecord::Base
  belongs_to :truck

scope :date_filter, lambda { |date| where("STRFTIME('%Y-%m-%d', date) < ?", date) }
  
  acts_as_gmappable :check_process => false
  
  def gmaps4rails_address
    "#{self.address}, Chicago, IL" 
  end
  
end
