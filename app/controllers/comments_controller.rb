class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @current_user = set_current_user
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/users/#{@user.id}/posts/#{@post.id}"
    else
      flash[:error] = 'ERROR! while posting comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
