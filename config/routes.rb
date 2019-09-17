Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    resources :users, only: %i[create]

    ##user/auth##
    get '/search/users/:id', to: 'users#index'
    post '/profile', to: 'users#profile'
    post '/login', to: 'auth#create'

    post '/followrequest/:id', to: 'users#follow_request'
    patch '/confirmfollowrequest/:id', to: 'users#confirm_follow_request'

    patch '/users/username', to: 'users#update_username'
    patch '/users/email', to: 'users#update_email'
    patch '/users/first_name', to: 'users#update_first_name'
    patch '/users/last_name', to: 'users#update_last_name'
    patch '/users/image', to: 'users#update_image'


    #events
    get '/events/:id', to: 'events#show'
    get '/search/events/:id', to: 'events#search'
    get '/events', to: 'events#index'
    get '/users/:id/events', to: 'events#user_events'
    post '/events', to: 'events#create'

    #invite
    get '/events/:id/invites', to: 'invites#index'
    post '/events/:id/invites', to: 'invites#create'
    patch '/events/:event_id/invites/:invite_id', to: 'invites#rsvp'

    #costs
    post '/users/:user_id/budgets/:budget_id/costs', to: 'costs#create'
    delete '/costs', to: 'costs#destroy'

    # messages
    get '/users/:user_id/messages', to: 'messages#index'

    # reply
    post '/replies', to: 'replies#create'




  end
end



end
