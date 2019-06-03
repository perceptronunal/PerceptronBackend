# == Schema Information
#
# Table name: pets
#
#  id              :bigint           not null, primary key
#  Pet_Type        :string
#  Pet_Name        :string
#  Pet_Gender      :string
#  Pet_Age         :integer
#  Pet_Size        :string
#  Pet_Color       :string
#  Pet_Sterilized  :boolean
#  Pet_Vaccinated  :boolean
#  Pet_Description :text
#  Pet_Visible     :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
