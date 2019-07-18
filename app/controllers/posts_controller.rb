class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy, :comments]
  before_action :rol, only: [:create, :update, :destroy, :create_comments]

  # GET /posts
  def index
    @posts = Post.paginate(page: params[:page], per_page:25).order('updated_at DESC')

    render json: @posts, each_serializer: PostAllSerializer, include: ['organization', 'organization.resources', 'resources','comments.user']
  end

  # GET /posts/1
  def show
    render json: @post, serializer: PostShowSerializer
  end

  # POST /posts
  def create
    if @organization != nil
      @post = Post.new(post_params)

      if @post.save
        render json: @post, status: :created, location: @post, serializer: PostAllSerializer, include: ['organization', 'organization.resources', 'resources','comments.user']
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @organization != nil
      if current_login[:id] == @organization[:organization_id] 
        if @post.update(post_params)
          render json: @post, serializer: PostSerializer
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /posts/1
  def destroy
    if @organization != nil
      @post.destroy
    end
  end

  
  def create_comments
    comment = Comment.new(Comment_Comment: comment_params[:Comment_Comment], commenteable_type: "Post", commenteable_id: params[:id], user_id: @user.id)
    if comment.save
      render json: comment, status: :created, location: comment, serializer: CommentSerializer
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def create_resource
    
    resource = Resource.new(file: resource_params[:file], resourceable_type: "Post", resourceable_id: params[:id])
    
    if resource.save
      link = 'https://petshappy2.s3-us-west-1.amazonaws.com/'+ resource.file.key
      file = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).filename
      byte = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).byte_size
      type = ActiveStorageBlob.find(ActiveStorageAttachment.all().last.id).content_type
      
      resource.update(Resource_Link: link, filename: file, bytesize: byte, Resource_Type: type)
      
      #render json: resource, status: :created, location: resource
      render :json => resource, status: :created, location: resource
    else
      #render json: resource.errors, status: :unprocessable_entity
      render :json => resource.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:Post_Title, :Post_Content, :Post_Tag, :organization_id)
    end

    def comment_params
      params.require(:comment).permit(:Comment_Comment)
    end

    def resource_params
      params.permit(:file)
    end

    def rol
      if !current_login.nil?
        @user = User.find_by(User_Email: current_login[:email])
        @organization = Organization.find_by(Organization_Email: current_login[:email])
      end
    end

end