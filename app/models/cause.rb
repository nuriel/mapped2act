class Cause < ActiveRecord::Base
  acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :process_geocoding => :geocode?,
                    :address => "address", :normalized_address => "address",
                    :msg => "Sorry, not even Google could figure out where that is"

  attr_accessible :address, :email, :latitude, :logo, :longitude, :name, :one_liner, :phone, :social_contribution, :website


  def geocode?
    (!address.blank? && (lat.blank? || lng.blank?)) || address_changed?
  end
  
end
