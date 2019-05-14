require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resource = resources(:one)
  end

  test "should get index" do
    get resources_url, as: :json
    assert_response :success
  end

  test "should create resource" do
    assert_difference('Resource.count') do
      post resources_url, params: { resource: { Resource_Link: @resource.Resource_Link, Resource_Type: @resource.Resource_Type } }, as: :json
    end

    assert_response 201
  end

  test "should show resource" do
    get resource_url(@resource), as: :json
    assert_response :success
  end

  test "should update resource" do
    patch resource_url(@resource), params: { resource: { Resource_Link: @resource.Resource_Link, Resource_Type: @resource.Resource_Type } }, as: :json
    assert_response 200
  end

  test "should destroy resource" do
    assert_difference('Resource.count', -1) do
      delete resource_url(@resource), as: :json
    end

    assert_response 204
  end
end
