# == Schema Information
#
# Table name: causes
#
#  id                  :integer          not null, primary key
#  state               :integer
#  name                :string(255)
#  website             :string(255)
#  phone               :string(255)
#  email               :string(50)
#  social_contribution :text
#  one_liner           :string(100)
#  address             :string(255)
#  latitude            :float
#  longitude           :float
#  logo                :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  gmaps               :boolean
#

class Cause < ActiveRecord::Base
  acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :process_geocoding => :geocode?,
                    :address => "address", :normalized_address => "address",
                    :msg => "Sorry, not even Google could figure out where that is"

  attr_accessible :address, :email, :latitude, :logo, :longitude, :name, :one_liner, :phone, :social_contribution, :website

  scope :authorized, -> { where(:state => STATE.index(:approved)) }
  scope :awaiting_approval, -> { where(:state => STATE.index(:awaiting_approval)) }

  def geocode?
    (!address.blank? && (latitude.blank? || longitude.blank?)) #|| address_changed?
  end


  # states - do not change order, add new stated to the end of the array
  STATE = [:awaiting_approval, :approved]

  def state=(value)
    self.state = STATE.index(value)
  end
  
end
