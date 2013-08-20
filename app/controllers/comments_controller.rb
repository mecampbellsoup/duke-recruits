class CommentsController < ApplicationController
  def create
    if user_signed_in?
      @event = Event.find(params[:event_id])
      @comment = @event.comments.build comment_params
      @comment.upvotes = 0
      if @comment.save
        flash[:notice] = "Success - you left a comment for #{@event.title}!"
        redirect_to @comment.event
      else
        render :action => 'events/show'
      end
    else
      redirect_to new_user_session_path, alert: "Only logged in users can create comments"
    end
  end

  def update
    redirect_to @comment.event
  end

  def upvote
    Comment.increment_counter(:upvotes, params[:id])
    redirect_to event_path(params[:id])
    binding.pry
  end

  private

  def comment_params
    params.require(:comment).permit(:post, :user_id, :event_id).merge(event_id: params[:event_id]).merge(user_id: current_user.id)
  end
end
