class Api::V1::RepliesController < ApplicationController

  def create
    @reply = Reply.create(reply_params)
    if @reply.valid?
      render json: @reply, include: [:user]
    else
      render json: @reply.errors.full_messages
    end

  end


private

def reply_params
  params.require(:reply).permit(:content, :user_id, :message_id)
end


end
