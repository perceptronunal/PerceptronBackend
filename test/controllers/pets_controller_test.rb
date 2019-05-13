require 'test_helper'

class PetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet = pets(:one)
  end

  test "should get index" do
    get pets_url, as: :json
    assert_response :success
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post pets_url, params: { pet: { Pet_Adopted: @pet.Pet_Adopted, Pet_Age: @pet.Pet_Age, Pet_Description: @pet.Pet_Description, Pet_Gender: @pet.Pet_Gender, Pet_Name: @pet.Pet_Name, Pet_Size: @pet.Pet_Size, Pet_Sterilized: @pet.Pet_Sterilized, Pet_Type: @pet.Pet_Type, Pet_vaccinated: @pet.Pet_vaccinated } }, as: :json
    end

    assert_response 201
  end

  test "should show pet" do
    get pet_url(@pet), as: :json
    assert_response :success
  end

  test "should update pet" do
    patch pet_url(@pet), params: { pet: { Pet_Adopted: @pet.Pet_Adopted, Pet_Age: @pet.Pet_Age, Pet_Description: @pet.Pet_Description, Pet_Gender: @pet.Pet_Gender, Pet_Name: @pet.Pet_Name, Pet_Size: @pet.Pet_Size, Pet_Sterilized: @pet.Pet_Sterilized, Pet_Type: @pet.Pet_Type, Pet_vaccinated: @pet.Pet_vaccinated } }, as: :json
    assert_response 200
  end

  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete pet_url(@pet), as: :json
    end

    assert_response 204
  end
end
