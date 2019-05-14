require 'test_helper'

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:one)
  end

  test "should get index" do
    get organizations_url, as: :json
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post organizations_url, params: { organization: { Organization_Address: @organization.Organization_Address, Organization_Description: @organization.Organization_Description, Organization_Email: @organization.Organization_Email, Organization_Name: @organization.Organization_Name, Organization_Phone: @organization.Organization_Phone, Organization_Website: @organization.Organization_Website } }, as: :json
    end

    assert_response 201
  end

  test "should show organization" do
    get organization_url(@organization), as: :json
    assert_response :success
  end

  test "should update organization" do
    patch organization_url(@organization), params: { organization: { Organization_Address: @organization.Organization_Address, Organization_Description: @organization.Organization_Description, Organization_Email: @organization.Organization_Email, Organization_Name: @organization.Organization_Name, Organization_Phone: @organization.Organization_Phone, Organization_Website: @organization.Organization_Website } }, as: :json
    assert_response 200
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete organization_url(@organization), as: :json
    end

    assert_response 204
  end
end
