class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy, :comments]
  before_action :rol, only: [:create, :update, :destroy]
  before_action :authenticate_login, only: [:create, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.paginate(page: params[:page], per_page:25)

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    if @organization != nil
      @post = Post.new(post_params)

      if @post.save
        render json: @post, status: :created, location: @post
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
          render json: @post
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

  def comments
    #post = Post.find(params[:id])
    render json: post.comments
  end
  
  def create_comments
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: :created, location: comment
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
      params.require(:comment).permit(:Comment_Comment, :commenteable_type, :commenteable_id, :user_id)
    end

    def rol
      if !current_login.nil?
        @user = User.find_by(User_Email: current_login[:email])
        @organization = Organization.find_by(Organization_Email: current_login[:email])
      end
    end

end