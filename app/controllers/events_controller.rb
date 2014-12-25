class EventsController < ApplicationController

  def index
    @events = Event.paginate(page: params[:page])
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "New Event Created."
      redirect_to @event
    else
      flash.now[:error] = "Something went wrong."
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees.paginate(page: params[:page], per_page: 20)
  end

  private
    def event_params
      params.require(:event).permit(:name, :date)
    end
end
