Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    resources :users, only: %i[create]

    ##user/auth##
    get '/users', to: 'users#index'
    post '/profile', to: 'users#profile'
    post '/login', to: 'auth#create'

    patch '/users/username', to: 'users#update_username'
    patch '/users/email', to: 'users#update_email'
    patch '/users/first_name', to: 'users#update_first_name'
    patch '/users/last_name', to: 'users#update_last_name'
    patch '/users/image', to: 'users#update_image'


    #events
    get '/events/:id', to: 'events#show'
    get '/events', to: 'events#index'
    get '/users/:id/events', to: 'events#user_events'
    post '/events', to: 'events#create'




  end
end



end
