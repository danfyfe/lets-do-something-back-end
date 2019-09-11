class Api::V1::CostsController < ApplicationController


def create
  @cost = Cost.find_or_create_by(costs_params)

  if @cost.valid?
    render json: { cost: CostSerializer.new(@cost) }
  else
    render json: { error: @cost.errors.full_messages }
  end
end

def delete

end


private

def costs_params
  params.require(:cost).permit(:name,:price, :budget_id, :user_id)
end




end
