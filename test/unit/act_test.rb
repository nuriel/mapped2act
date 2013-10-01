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

require 'test_helper'

class ActTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
