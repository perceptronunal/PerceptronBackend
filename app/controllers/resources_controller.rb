class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :update, :destroy]
  before_action :authenticate_login, only: [:create, :update, :destroy]

  # GET /resources
  def index
    @resources = Resource.paginate(page: params[:page], per_page:25)

    render json: @resources
  end

  # GET /resources/1
  def show
    # data = open('https://petshappy2.s3-us-west-1.amazonaws.com/'+ @resource.file.key) 
    # send_data data.read, type: @resource.file.content_type, disposition: 'inline'
    # send_file @resource.path_file(@resource.file), type: @resource.file.content_type, disposition: 'inline'
    redirect_to @resource.path_file(@resource.file)
    # render json: @resource
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # POST /resources
  def create
    type = resource_params_poly[:Resourceable_Type]
    id = resource_params_poly[:Resourceable_Id]
    
    case type
    when "post"
      @post = Post.find(id)
      @resource = @post.resources.new(resource_params) 
    when "pet"
      @pet = Pet.find(id)
      @resource = @pet.resources.new(resource_params)
    when "organization"
      @organization = Organization.find(id)
      @resource = @organization.resources.new(resource_params) 
    when "user"
      @user = User.find(id)
      @resource = @user.resources.new(resource_params)
    else
    end

    if @resource.save
      @resource.Resource_Link = 'https://petshappy2.s3-us-west-1.amazonaws.com/'+ @resource.file.key
      @resource.filename = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).filename
      @resource.bytesize = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).byte_size
      render json: @resource, status: :created, location: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resources/1
  def update
    if @resource.update(resource_params_poly)
      @resource.link = 'https://petshappy2.s3-us-west-1.amazonaws.com/'+ @resource.file.key
      @resource.filename = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).filename
      @resource.bytesize = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).byte_size
      render json: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resources/1
  def destroy
    @resource.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:resource).permit(:Resource_Type, :file)
    end

    def resource_params_poly
      params.require(:resource).permit(:Resourceable_Type, :Resourceable_Id, :file)
    end
end
