class Api::V1::EventsController < ApplicationController

def search
  @user = User.find(params[:id])

  def follower_events
    @user.followers.map do |follower|
      follower.events
    end
  end

  @events = follower_events

  @events << @user.events

  @events = @events.flatten.uniq

  render json: @events, include: [:users]

end


def show
  @event = Event.find(params[:id])
  @users = @event.users
  @invites = @event.invites
  render json: @event, include: [:users, :invites]
end


def user_events
  @user = User.find(params[:id])
  @events = @user.events
  render json: @events, include: [:users]
end

def create
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
