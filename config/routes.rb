Rails.application.routes.draw do
  root to: 'home#landing'
  resources :users
  resources :images

  scope :manage do
    get 'images/:type', to: 'images#manage', as: 'manage_images'
  end

  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
