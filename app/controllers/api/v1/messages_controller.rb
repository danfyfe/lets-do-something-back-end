class Api::V1::MessagesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @messages = @user.messages

    render json: @messages, include: [:replies]

  end

  def create
    @message = Message.create(messages_params)
    if @message.valid?
      render json: @message, include: [:replies]
    else
      render json: { error: @message.errors.full_messages}
    end
  end


  def delete

  end


  private

  def messages_params
    params.require(:message).permit(:user_id, :event_id, :title, :content)
  end

end
