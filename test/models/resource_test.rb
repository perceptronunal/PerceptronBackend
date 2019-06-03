# == Schema Information
#
# Table name: resources
#
#  id                :bigint           not null, primary key
#  Resource_Type     :string
#  Resource_Link     :string
#  resourceable_type :string
#  resourceable_id   :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
