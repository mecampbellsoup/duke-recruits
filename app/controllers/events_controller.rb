class EventsController < ApplicationController
  before_action :authenticate_user!
  layout 'application_with_sidebar'

  def index
    @events = Event.all
    @companies = @events.collect do |event|
      Company.find(event.company_id)
    end
    #@company = @companies.find(params[:id])  ...some action to get a single company
  end

  def new
    @event = Event.new(event_params)
  end

  def show
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date, :end_date, :company_id)
  end
end
