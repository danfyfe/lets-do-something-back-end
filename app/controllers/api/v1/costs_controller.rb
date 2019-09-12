class Api::V1::CostsController < ApplicationController


def create
  @cost = Cost.create(costs_params)

  if @cost.valid?
    render json: { cost: CostSerializer.new(@cost) }
  else
    render json: { error: @cost.errors.full_messages }
  end
end

def destroy
  @cost = Cost.find_by(delete_params)
  @cost_id = @cost.id

  @cost.destroy

  render json: { costId: @cost_id }
end


private

def costs_params
  params.require(:cost).permit(:name,:price, :budget_id, :user_id)
end

def delete_params
  params.require(:cost).permit(:id)
end



end
