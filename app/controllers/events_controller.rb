class EventsController < ApplicationController
  before_action :authenticate_user!
  layout 'application_with_sidebar'

  def index
    @events = Event.all
    @companies = @events.collect do |event|
      Company.find(event.company_id)
      end
    if params[:table]
      render :index_table
    else
      render :index
    end
  end

  def new
    @event = Event.new(event_params)
  end

  def create  #create in this context will add event to user's calendar
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date, :end_date, :company_id)
  end
end
