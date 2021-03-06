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
#  cause_category_id   :integer
#

class Cause < ActiveRecord::Base
  # behaviours
  mount_uploader :logo, ImageUploader

  acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :process_geocoding => :geocode?,
                    :address => "address", :normalized_address => "address",
                    :msg => "Sorry, not even Google could figure out where that is"

  attr_accessible :address, :email, :latitude, :logo, :longitude, :name, :one_liner, :phone, :social_contribution,
                  :website, :cause_category_id, :act_ids, :act_attributes

  # RELATIONS
  belongs_to :cause_category
  has_many :act_causes, dependent: :destroy
  has_many :acts, through: :act_causes

  accepts_nested_attributes_for :acts, :allow_destroy => true #, :reject_if => :all_blank

  # SCOPES
  scope :authorized, -> { where(:state => STATE.index(:approved)) }
  scope :awaiting_approval, -> { where(:state => STATE.index(:awaiting_approval)) }

  # VALIDATIONS
  validates :address, :email, :name, :phone, :social_contribution, :website, presence: true      #, :one_liner
  validates_url :website
  validates_length_of :one_liner, :minimum => 3, :maximum => 100, :allow_blank => true

  # CALLBACKS



  def geocode?
    (!address.blank? && (latitude.blank? || longitude.blank?)) #|| address_changed?
  end

  # states - do not change order, add new states to the end of the array
  STATE = [:awaiting_approval, :approved]

  def set_state(value)
    self.state = STATE.index(value)
    self.save!
  end

  def logo_url
    self.logo.url
  end

end
