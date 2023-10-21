class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.where(author_id: params[:id]).order(created_at: :desc)
  end

  def index
    @user = User.order(created_at: :asc)
    @user.each do |user|
      puts user
    end
  end
end
