# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  User_Name  :string
#  User_Email :string
#  User_Phone :string
#  User_City  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
