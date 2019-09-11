class Api::V1::CostsController < ApplicationController


def create
  byebug
end

def delete

end


private

def costs_params
  params.require(:cost).permit(:name,:price)
end




end
