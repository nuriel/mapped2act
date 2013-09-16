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

require 'test_helper'

class CauseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
