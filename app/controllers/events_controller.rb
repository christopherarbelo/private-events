class EventsController < ApplicationController
  before_action :require_login, only: [:new, :create, :destroy]
  before_action :require_ownership, only: [:destroy]
  
  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.hosted_events.build(event_params)

    if @event.save
      flash[:notice] = 'Event created!'
      redirect_to @event
    else
      flash.now[:error] = 'Whoops, something went wrong!'
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = 'Event deleted!'
    redirect_to root_path
  end

  private
  def event_params
    params.require(:event).permit(:date, :location)
  end

  def require_ownership
    unless current_user.id == params[:id]
      flash[:error] = 'You do you own this resource.'
      redirect_to root_path
    end
  end

  def require_login
    unless signed_in?
      flash[:error] = 'You must be logged in.'
      redirect_to new_session_path
    end
  end
end
