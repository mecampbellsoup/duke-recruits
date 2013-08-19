class CommentsController < ApplicationController
  def create
    if user_signed_in?
      safe_comment = params.require(:comment).permit(:post).merge(event_id: params[:event_id])
      @comment = current_user.comments.create safe_comment
      redirect_to @comment.event
    else
      redirect_to new_user_session_path, alert: "Only logged in users can create comments"
    end
  end
end
