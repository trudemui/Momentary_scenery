class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to @comment.board
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.board
  end

  private
  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end
end
