class Api::V1::EventsController < ApplicationController

def user_events
  # byebug
  @user = User.find(params[:id])
  @events = @user.events
  render json: @events

end

def create
  # byebug
  @owner = User.find(params[:event][:owner_id])
  @event = Event.create(event_params)
  if @event.valid?
    UserEvent.create(user_id: @owner.id, event_id: @event.id)
    render json: @event
  else
    render json: { error: @event.errors.full_messages}
  end
end

def delete

end



private

def event_params
  params.require(:event).permit(:title, :description, :start, :end, :password, :owner_id)
end



end
