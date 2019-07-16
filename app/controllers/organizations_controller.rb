class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :update, :destroy]
  before_action :rol, only: [:update, :destroy, :upload_profile]
  before_action :authenticate_login, only: [:update, :destroy]

  # GET /organizations
  def index
    @organizations = Organization.paginate(page: params[:page], per_page:25)

    render json: @organizations, each_serializer: OrganizationSerializer
  end

  # GET /organizations/1
  def show
    render json: @organization, serializer: OrganizationShowSerializer
  end

  # POST /organizations
  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      @login = Login.new(email: @organization.Organization_Email, password_digest: @organization.password_digest)
      @login.save

      @resource = profile_default(Organization.find_by(Organization_Email: @organization.Organization_Email))
      @resource.save

      render json: @organization, status: :created, location: @organization, serializer: OrganizationSerializer
    else
      render json: @organization.errors, status: :unprocessable_entity
    end


  end
  
  def upload_profile
    @old_resource = @organization_aut.resources.where(Resource_Type: 'profile').first
    
    
    if @old_resource != nil
      @old_resource.destroy
    else
      puts "no habia nada"
    end

    new_resource = Resource.new(file: resource_params[:file], resourceable_type: "Organization", resourceable_id: @organization_aut.id, Resource_Type: 'profile')
    
    if new_resource.save
      puts "bien"
    else
      puts "mal"
    end

    update_resource = @organization_aut.resources.where(Resource_Type: 'profile').first

    if update_resource != nil
      link = 'https://petshappy2.s3-us-west-1.amazonaws.com/'+ update_resource.file.key
      file_name = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).filename
      byte_size = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).byte_size

      if update_resource.update(Resource_Link: link, bytesize: byte_size, filename: file_name)
        render json: update_resource, status: 200
      else
        render json: update_resource.errors, status: :unprocessable_entity
      end
    end

  end
  # PATCH/PUT /organizations/1
  def update
    if @organization_aut.id == @organization.id
      @login = Login.find_by(email: @organization.Organization_Email)
      if @organization.update(organization_params_update)
        render json: @organization, status: 200, location: @organization, serializer: OrganizationSerializer
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

    def profile_default(organization)
      Resource.create(
        Resource_Type: "profile",
        Resource_Link: "https://petshappy2.s3-us-west-1.amazonaws.com/user.png",
        resourceable_type: "Organization",
        resourceable_id: organization.id,
        filename: "user.png",
        bytesize: 6000
      )
    end

    def rol
      if !current_login.nil?
        @user_aut = User.find_by(User_Email: current_login[:email])
        @organization_aut = Organization.find_by(Organization_Email: current_login[:email])
      end
    end
end
