class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy, :comments]
  before_action :rol, only: [:create, :update, :destroy, :create_comments]
  before_action :authenticate_login, only: [:create, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.paginate(page: params[:page], per_page:25).order('updated_at DESC')

    render json: @posts, each_serializer: PostAllSerializer, include: ['organization', 'resources', 'comments.user']
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
        render json: @post, status: :created, location: @post, serializar: PostSerializer
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
          render json: @post, serializar: PostSerializer
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

    def rol
      if !current_login.nil?
        @user = User.find_by(User_Email: current_login[:email])
        @organization = Organization.find_by(Organization_Email: current_login[:email])
      end
    end

end