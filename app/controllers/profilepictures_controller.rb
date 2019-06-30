class ProfilepicturesController < ApplicationController
  before_action :set_profilepicture, only: [:show, :update, :destroy]

  # GET /profilepictures
  def index
    @profilepictures = Profilepicture.all

    render json: @profilepictures
  end

  # GET /profilepictures/1
  def show
    #render json: @profilepicture
    redirect_to @profilepicture.path_file(@profilepicture.file)
  end

  # GET /profilepictures/new
  def new
    @profilepicture = Profilepicture.new
  end

  # POST /profilepictures
  def create
    type = profilepictures_params_poly[:Profilepicturesable_Type]
    id = profilepictures_params_poly[:Profilepicturesable_Id]

    case type
    when "user"
      @user = User.find(id)
      @profilepicture = @user.profilepictures.new(profilepicture_params)
    when "organization"
      @organization = Organization.find(id)
      @profilepicture = @organization.profilepictures.new(profilepicture_params)
    else
    end

    if @profilepicture.save
      @profilepicture.ProfilePicture_Link = 'https://petshappy2.s3-us-west-1.amazonaws.com/'+ @profilepicture.file.key
      @profilepicture.ProfilePicture_Filename = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).filename
      @profilepicture.ProfilePicture_Bytesize = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).byte_size
      
      render json: @profilepicture, status: :created, location: @profilepicture
    else
      render json: @profilepicture.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profilepictures/1
  def update
    if @profilepicture.update(profilepictures_params_poly)
      @profilepicture.ProfilePicture_Link = 'https://petshappy2.s3-us-west-1.amazonaws.com/'+ @profilepicture.file.key
      @profilepicture.ProfilePicture_Filename = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).filename
      @profilepicture.ProfilePicture_Bytesize = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).byte_size
      
      render json: @profilepicture
    else
      render json: @profilepicture.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profilepictures/1
  def destroy
    @profilepicture.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profilepicture
      @profilepicture = Profilepicture.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profilepicture_params
      params.require(:profilepicture).permit(:avatar)
    end

    def profilepictures_params_poly
      params.require(:profilepicture).permit(:Profilepicturesable_Type, :Profilepicturesable_Id, :avatar)
    end
end
