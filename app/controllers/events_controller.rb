class EventsController < ApplicationController
  def index
    @events = Event.all
    @companies = Company.where(id: @events.company_id)
  end

  private

  # def event_params
  #   params.require(:event).permit(:title, :location, :date, :end_date, :company_id)
  # end
end
