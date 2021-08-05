class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update attend]
  # GET /events or /events.json
  def index
    @events = Event.all
    @upcoming_events = Event.future_events
    @past_events = Event.past_events
  end

  def event
    @events = current_user.events.all
  end

  def attend
    @event.attendees << current_user
    redirect_to users_path
  end

  # GET /events/1 or /events/1.json
  def show
    @events = Event
  end

  # GET /events/new
  def new
    @event = current_user.events.build
  end

  # GET /events/1/edit
  def edit; end

  # POST /events or /events.json
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      attend
      flash[:notice] = 'Event created successfully'
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:time, :location, :user_id, :title, :email)
  end
end
