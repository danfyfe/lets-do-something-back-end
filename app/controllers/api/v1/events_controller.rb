class Api::V1::EventsController < ApplicationController

def show
  # byebug
  @event = Event.find(params[:id])
  render json: @event, include: [:users]
end


def user_events
  @user = User.find(params[:id])
  @events = @user.events
  # byebug
  render json: @events, include: [:users]
end

def create
  # byebug
  @owner = User.find(params[:event][:owner_id])
  @event = Event.create(event_params)
  if @event.valid?
    UserEvent.create(user_id: @owner.id, event_id: @event.id)
    render json: @event, include: [:users]
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
