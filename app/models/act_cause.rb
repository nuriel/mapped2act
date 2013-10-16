# == Schema Information
#
# Table name: act_causes
#
#  id         :integer          not null, primary key
#  act_id     :integer
#  cause_id   :integer
#  message    :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ActCause < ActiveRecord::Base
  attr_accessible :act_id, :cause_id, :message, :url

  belongs_to :act
  belongs_to :cause

  validates_url :url

end
