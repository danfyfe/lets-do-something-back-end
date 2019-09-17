class Api::V1::MessagesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @messages = @user.messages

    render json: @messages, include: [:replies]

  end

  def create

  end


  def delete

  end


  private

  def messages_params

  end

end
