# == Schema Information
#
# Table name: cause_categories
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  marker_address :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class CauseCategory < ActiveRecord::Base
  attr_accessible :description, :marker_address, :name

  has_many :causes

  validates :name, :description, presence: true
end
