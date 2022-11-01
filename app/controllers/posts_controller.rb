class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    # @posts = @user.posts
    @posts = @user.posts.includes(:comments)
  end

  def show
    # @user = User.find(params[:user_id])
    # @post = @user.posts.find(params[:id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    new_post = current_user.posts.new(post_data)
    new_post.likes_counter = 0
    new_post.comments_counter = 0
    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to "/users/#{new_post.author_id}/posts/", notice: 'Success Post Saved!'
        else
          render :new, status: 'Error occured with Post!'
        end
      end
    end
  end

  private

  def post_data
    params.require(:posts).permit(:title, :text)
  end
end
