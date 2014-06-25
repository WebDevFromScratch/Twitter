Rails.application.routes.draw do

  #root - what should it render? (login and register controller?)

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]

  #get '/:username/statuses/new', to: 'statuses#new', as: 'new_status'
  #post '/:username/statuses', to: 'statuses#create'  #WONDER how to do that kind of paths?
                                                      #(non-standart nested paths)

  resources :statuses, only: [:new, :create] #TODO: change to 'register' routes maybe?

  get '/:username', to: 'users#show', as: 'user' #this 'as' method is used
                                                 #to be able to refer to this path
                                                 #later as 'user_path'
                                          #notice how that shows in routes (as a prefix)
                                      #this should go last (or not before other routes
                                      #that use '/sth' right on the root - b/c the scheme
                                      #of this would block other actions and e.g. '/login
                                      #would be considered as user')
end
