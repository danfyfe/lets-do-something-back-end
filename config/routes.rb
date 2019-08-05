Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    resources :users, only: %i[create]

    ##user/auth##
    get '/users', to: 'users#index'
    post '/profile', to: 'users#profile'
    post '/login', to: 'auth#create'


  end
end



end
