class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/styles/#{comment.style.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, style_id: params[:style_id])
  end
end
