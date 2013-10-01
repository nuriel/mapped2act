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

require 'test_helper'

class ActCauseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
