class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :update, :destroy]
  before_action :rol, only: [:update, :destroy]
  before_action :authenticate_login, only: [:update, :destroy]

  # GET /organizations
  def index
    @organizations = Organization.paginate(page: params[:page], per_page:25)

    render json: @organizations, each_serializer: OrganizationSerializer
  end

  # GET /organizations/1
  def show
    render json: @organization, serializer: OrganizationSerializer
  end

  # POST /organizations
  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      render json: @organization, status: :created, location: @organization, serializer: OrganizationSerializer
    else
      render json: @organization.errors, status: :unprocessable_entity
    end

    @login = Login.new(email: @organization.Organization_Email, password_digest: @organization.password_digest)
    @login.save
  end
  def upload_profile
    resource = Resource.new(file: resource_params[:file], resourceable_type: "Organization", resourceable_id: @organization_aut.id)
    
    if resource.save
      link = 'https://petshappy2.s3-us-west-1.amazonaws.com/'+ resource.file.key
      file = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).filename
      byte = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).byte_size
      #type = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).content_type
      type = 'profile'
      resource.update(Resource_Link: link, filename: file, bytesize: byte, Resource_Type: type)
      
      render :json => resource, status: :created, location: resource
    else
      render :json => resource.errors, status: :unprocessable_entity
    end
  end
  # PATCH/PUT /organizations/1
  def update
    if current_organization[:id] == @organization_aut.id
      @login = Login.find_by(email: @organization.Organization_Email)
      if @organization.update(organization_params_update)
        render json: @organization, serializer: OrganizationSerializer
      else
        render json: @organization.errors, status: :unprocessable_entity
      end
      @login.update(email: @organization.Organization_Email, password_digest: @organization.password_digest)
    end
  end

  # DELETE /organizations/1
  def destroy
    #change me :(
    @organization.destroy
    Login.find_by(email: @organization.Organization_Email).destroy
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

    def resource_params
      params.permit(:file)
    end

    def organization_params_update
      params.require(:organization).permit(:Organization_Name, :Organization_Address, :Organization_Phone, :Organization_Email, :Organization_Website, :Organization_Description, :Organization_Validation)
    end

    def rol
      if !current_login.nil?
        @user_aut = User.find_by(User_Email: current_login[:email])
        @organization_aut = Organization.find_by(Organization_Email: current_login[:email])
      end
    end
end
