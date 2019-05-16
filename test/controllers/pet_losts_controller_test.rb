require 'test_helper'

class PetLostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet_lost = pet_losts(:one)
  end

  test "should get index" do
    get pet_losts_url, as: :json
    assert_response :success
  end

  test "should create pet_lost" do
    assert_difference('PetLost.count') do
      post pet_losts_url, params: { pet_lost: { PetLost_Found: @pet_lost.PetLost_Found, PetLost_Gender: @pet_lost.PetLost_Gender, PetLost_Name: @pet_lost.PetLost_Name, PetLost_Size: @pet_lost.PetLost_Size, PetLost_Type: @pet_lost.PetLost_Type, PetLost_Description: @pet_lost.PetLost_Description } }, as: :json
    end

    assert_response 201
  end

  test "should show pet_lost" do
    get pet_lost_url(@pet_lost), as: :json
    assert_response :success
  end

  test "should update pet_lost" do
    patch pet_lost_url(@pet_lost), params: { pet_lost: { PetLost_Found: @pet_lost.PetLost_Found, PetLost_Gender: @pet_lost.PetLost_Gender, PetLost_Name: @pet_lost.PetLost_Name, PetLost_Size: @pet_lost.PetLost_Size, PetLost_Type: @pet_lost.PetLost_Type, PetLost_Description: @pet_lost.PetLost_Description } }, as: :json
    assert_response 200
  end

  test "should destroy pet_lost" do
    assert_difference('PetLost.count', -1) do
      delete pet_lost_url(@pet_lost), as: :json
    end

    assert_response 204
  end
end
