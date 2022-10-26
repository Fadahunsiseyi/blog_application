class PostsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @posts = Post.where(author_id: params[@user.id])
    end
    def show
        @user = User.find(params[:user_id])
        @posts = Post.where(author_id: params[@user.id])
    end
  end