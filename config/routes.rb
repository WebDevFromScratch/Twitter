Rails.application.routes.draw do

  #root - what should it render? (login and register controller?)

  get '/:username', to: 'users#show', as: 'user' #this 'as' method is used
                                                 #to be able to refer to this path
                                                 #later as 'user_path'
                                          #notice how that shows in routes (as a prefix)

  #get '/:username/statuses/new', to: 'statuses#new', as: 'new_status'
  #post '/:username/statuses', to: 'statuses#create'

  resources :statuses, only: [:new, :create]
end
