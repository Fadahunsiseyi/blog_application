class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    # @posts = @user.posts
    @posts = Post.where(user_id: params[@user.id])
  end

  def show
    # @user = User.find(params[:user_id])
    # @post = @user.posts.find(params[:id])
    @post = Post.find(params[:id])
  end
end
