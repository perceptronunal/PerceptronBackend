# == Schema Information
#
# Table name: organizations
#
#  id                       :bigint           not null, primary key
#  Organization_Name        :string
#  Organization_Address     :string
#  Organization_Phone       :string
#  Organization_Email       :string
#  Organization_Website     :string
#  Organization_Description :string
#  Organization_Validation  :boolean
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
