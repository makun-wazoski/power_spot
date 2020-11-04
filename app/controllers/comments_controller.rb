class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment=@post.comments.create(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      # flash.now[:alert] = "Comment failed"
      # @comment = Comment.new
      @comments= @post.comments.includes(:user)
      render "posts/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
      redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
