class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :update, :destroy]
  before_action :authenticate_organization, only: [:update, :destroy]

  # GET /organizations
  def index
    @organizations = Organization.paginate(page: params[:page], per_page:25)

    render json: @organizations
  end

  # GET /organizations/1
  def show
    render json: @organization
  end

  # POST /organizations
  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      render json: @organization, status: :created, location: @organization
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organizations/1
  def update
    if current_organization[:id] == @organization[:organization_id] 
      if @organization.update(organization_params)
        render json: @organization
      else
        render json: @organization.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /organizations/1
  def destroy
    #change me :(
    #@organization.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def organization_params
      params.require(:organization).permit(:Organization_Name, :Organization_Address, :Organization_Phone, :Organization_Email, :Organization_Website, :Organization_Description, :Organization_Validation, :password)
    end
end
