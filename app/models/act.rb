# == Schema Information
#
# Table name: acts
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :text
#  presentation :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Act < ActiveRecord::Base
  attr_accessible :description, :name, :presentation

  has_many :act_causes, dependent: :destroy
  has_many :causes, through: :act_causes

  accepts_nested_attributes_for :act_causes, :allow_destroy => true #, :reject_if => :all_blank

  scope :work_acts, ->{ where(:name => ENV['DEFAULT_JOBS_ACT_NAME']) }

  before_create :set_defaults

  def set_defaults
    self.presentation = self.name.humanize
  end
end
