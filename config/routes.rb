Rails.application.routes.draw do

   root 'deals#index'

   get '/signup' => 'users#new'
   post '/users' => 'users#create'

   get "/login" => 'sessions#new'
   post '/sessions' => 'sessions#create'
   get "/logout" => 'sessions#delete'



  #########################################################
  # The "Golden 7" for accessing the "deals" resource


  get '/deals/new' => 'deals#new', as: 'new_deal'
  post '/deals' => 'deals#create', as: 'deals'

  get '/deals' => 'deals#index'
  get '/deals/:id' => 'deals#show', as: 'deal'

  get '/deals/:id/edit' => 'deals#edit', as: 'edit_deal'
  patch '/deals/:id' => 'deals#update'

  delete '/deals/:id' => 'deals#destroy'


end
