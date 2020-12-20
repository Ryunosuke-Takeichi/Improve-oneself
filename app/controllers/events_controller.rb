class EventsController < ApplicationController
  def index
    @events = Event.where(user_id: params[:user_id])
  end
  
  def new
    @event = Event.new
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to user_events_path
    end
  end
  
  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
     redirect_to user_events_path
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to user_events_path
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :body, :start, :end, :user_id)
  end
  
end