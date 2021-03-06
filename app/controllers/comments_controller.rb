class CommentsController < ApplicationController
  before_action :set_params
  def create
    @comment = @post.comments.create(params[:comment].permit(:name, :body))

    if @comment.save
      redirect_to post_path(@post), notice: "Comment posted successfully"
    else
      redirect_to post_path(@post), notice: "Could not post comment"
    end
  end 

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_params
    @post = Post.find(params[:post_id])
  end
end
