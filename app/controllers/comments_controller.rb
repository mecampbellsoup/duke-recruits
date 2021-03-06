class CommentsController < ApplicationController
  before_action :authenticate_user!
  layout 'application_with_sidebar'

  def create
    if user_signed_in?
      @event = Event.find(params[:event_id])
      @comments = @event.comments.all
      @comment = @event.comments.build comment_params
      @comment.upvotes = 0
      if @comment.save
        flash[:notice] = "Success - you left a comment for #{@event.title}!"
        respond_to do |format|
          format.html { redirect_to @comment.event }
          format.js
        end
      else
        render :action => 'events/show'
        flash[:error] = "Comment failed to create :("
      end
    else
      redirect_to new_user_session_path, alert: "Only logged in users can create comments"
    end
  end

  def update
    redirect_to @comment.event
  end

  def upvote
    #params = {"comment"=>"28", "event"=>"3", "controller"=>"comments", "action"=>"upvote", "id"=>"3"}

    if Comment.increment_counter(:upvotes, params[:comment])
      redirect_to event_path(params[:event])
    else
      flash[:error] = "Your comment could not be posted :("
      redirect_to @comment.event
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post, :user_id, :event_id).merge(event_id: params[:event_id]).merge(user_id: current_user.id)
  end
end

def create
  @review = Review.create!(params[:review])
  flash[:notice] = "Thank you for reviewing this product"
  respond_to do |format|
    format.html { redirect_to @review.product }
    format.js
  end
end