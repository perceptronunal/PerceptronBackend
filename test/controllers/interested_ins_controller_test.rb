require 'test_helper'

class InterestedInsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interested_in = interested_ins(:one)
  end

  test "should get index" do
    get interested_ins_url, as: :json
    assert_response :success
  end

  test "should create interested_in" do
    assert_difference('InterestedIn.count') do
      post interested_ins_url, params: { interested_in: { Interest_Type: @interested_in.Interest_Type } }, as: :json
    end

    assert_response 201
  end

  test "should show interested_in" do
    get interested_in_url(@interested_in), as: :json
    assert_response :success
  end

  test "should update interested_in" do
    patch interested_in_url(@interested_in), params: { interested_in: { Interest_Type: @interested_in.Interest_Type } }, as: :json
    assert_response 200
  end

  test "should destroy interested_in" do
    assert_difference('InterestedIn.count', -1) do
      delete interested_in_url(@interested_in), as: :json
    end

    assert_response 204
  end
end
