class Api::V1::InvitesController < ApplicationController


  def create
    @event = Event.find(params[:id])
    @invitees = params[:inviteeIds]

    @invitees.map do |invitee|
      Invite.find_or_create_by(event_id: @event.id, user_id: invitee)
    end

    @invites = @event.invites

    @users = []

    @invites.map do |invite|
      @users << invite.user
    end

    render json: @users
  end


  def rsvp
    @event = Event.find(params[:event_id])
    @invite = Invite.find(params[:invite_id])
    @user = @invite.user
    @rsvp = params[:invite][:rsvp]

    @invite.update(rsvp: @rsvp)
    if @invite.rsvp
      @user_event = UserEvent.create( event_id: @event.id, user_id: @user.id)

      if @user_event.valid?
        render json: { event: EventSerializer.new(@event), invite: InviteSerializer.new(@invite)}
      else
        render json: { error: @user_event.errors.full_messages.first}
      end

    else
      render json: { status: 'Event declined', invite: InviteSerializer.new(@invite)}
    end

  end


  def delete

  end



  private

  def invites_params

  end


end
