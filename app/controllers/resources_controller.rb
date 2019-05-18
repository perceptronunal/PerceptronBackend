class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :update, :destroy]

  # GET /resources
  def index
    @resources = Resource.all

    render json: @resources
  end

  # GET /resources/1
  def show
    render json: @resource
  end

  # POST /resources
  def create
    type = resource_params[:Resource_Type2]
    id = resource_params[:Resource_Id]

    case type
    when "post"
      @post = Post.find(id)
      @resource = @post.resources.new(resource_params2) 
    when "pet_lost"
      @pet_lost = PetLost.find(id)
      @resource = @pet_lost.resources.new(resource_params2) 
    when "pet"
      @pet = Pet.find(id)
      @resource = @pet.resources.new(resource_params2)
    when "organization"
      @organization = Organization.find(id)
      @resource = @organization.resources.new(resource_params2) 
    when "user"
      @user = User.find(id)
      @resource = @user.resources.new(resource_params2) 
    else

    end

    if @resource.save
      render json: @resource, status: :created, location: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resources/1
  def update
    if @resource.update(resource_params)
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
    def resource_params2
      params.require(:resource).permit(:Resource_Type, :Resource_Link)
    end

    def resource_params
      params.require(:resource).permit(:Resource_Type2, :Resource_Id)
    end
end
