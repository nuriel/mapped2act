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

require 'test_helper'

class CauseCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
