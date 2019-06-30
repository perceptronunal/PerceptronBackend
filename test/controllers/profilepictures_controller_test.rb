require 'test_helper'

class ProfilepicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profilepicture = profilepictures(:one)
  end

  test "should get index" do
    get profilepictures_url, as: :json
    assert_response :success
  end

  test "should create profilepicture" do
    assert_difference('Profilepicture.count') do
      post profilepictures_url, params: { profilepicture: { ProfilePicture_Bytesize: @profilepicture.ProfilePicture_Bytesize, ProfilePicture_Filename: @profilepicture.ProfilePicture_Filename, ProfilePicture_Link: @profilepicture.ProfilePicture_Link } }, as: :json
    end

    assert_response 201
  end

  test "should show profilepicture" do
    get profilepicture_url(@profilepicture), as: :json
    assert_response :success
  end

  test "should update profilepicture" do
    patch profilepicture_url(@profilepicture), params: { profilepicture: { ProfilePicture_Bytesize: @profilepicture.ProfilePicture_Bytesize, ProfilePicture_Filename: @profilepicture.ProfilePicture_Filename, ProfilePicture_Link: @profilepicture.ProfilePicture_Link } }, as: :json
    assert_response 200
  end

  test "should destroy profilepicture" do
    assert_difference('Profilepicture.count', -1) do
      delete profilepicture_url(@profilepicture), as: :json
    end

    assert_response 204
  end
end
