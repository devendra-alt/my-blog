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

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
    @current_user = set_current_user
  end

  def create
    @post = Post.new(post_params)
    @user = User.find(params[:user_id])

    if @post.save
      redirect_to "/users/#{@user.id}/posts/#{@post.id}"
    else
      flash[:error] = 'ERROR! unable to save post'
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:title, :text, :author_id)
  end
end
