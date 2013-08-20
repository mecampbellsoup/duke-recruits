require 'icalendar'

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

  def export
    @event = Event.find(params[:id])
    @calendar = Icalendar::Calendar.new
    event = Icalendar::Event.new
    event.start = @event.date.strftime("%Y%m%dT%H%M%S")
    event.end = @event.end_date.strftime("%Y%m%dT%H%M%S")
    event.summary = @event.title
    event.description = @event.description
    event.location = @event.location
    @calendar.add event
    @calendar.publish
    headers['Content-Type'] = "text/calendar; charset=UTF-8"
    render :text => @calendar.to_ical
    #redirect_to event_path(params[:id])
  end

  def show
    @event = Event.find(params[:id])
    @company = @event.company
    @comments = @event.comments
    @comment = Comment.new(:event => @event)
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date, :end_date, :company_id)
  end
end
