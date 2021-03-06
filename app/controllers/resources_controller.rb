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
    #redirect_to @resource.path_file(@resource.file)    
    link = @resource.path_file(@resource.file)
    header = {'Access-Control-Allow-Origin': '*', 'content-type': 'multipart/form-data', 'Access-Control-Allow-Headers':'origin, content-type, accept'}
    response = HTTParty.get(link, header)
    send_data(response, disposition: 'inline', type: @resource.file.content_type)
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end


  # PATCH/PUT /resources/1
  def update
    if @resource.update(resource_params_poly)
      @resource.link = 'https://petshappy2.s3-us-west-1.amazonaws.com/'+ @resource.file.key
      @resource.filename = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).filename
      @resource.bytesize = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).byte_size
      @resource.Resource_Type = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).content_type
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
