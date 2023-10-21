class PostsController < ApplicationController
  def show
    @users = User.all
    @comments = Comment.all
    @post = Post.find(params[:id])
    @index = @post.id
  end

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).paginate(page: params[:page], per_page: 2).order(created_at: :desc)
    @users = User.all
    @comments = Comment.all
  end
end
