Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "users/invite", to:"users#invite"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:destroy] do
      post 'search',  :on => :collection


  end
  resources :movie_lists do
        resources :movies
        resources :ratings, only: [:new, :create]
  end

end
