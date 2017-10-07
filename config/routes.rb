Rails.application.routes.draw do
  root to: 'home#landing'
  resources :users
  resources :images
  resources :photographers


  get '/manage', to: 'home#manage', as: 'manage'
  scope :manage do
    get 'images/:type', to: 'images#manage', as: 'manage_images'
    get '/new_image_for/:type', to: 'images#new_image', as: 'manage_new_image'
    get 'photographers', to: 'photographers#manage', as: 'manage_photographers'
  end

  get '/faq', to: 'home#faq', as: 'question'
  get '/credits', to: 'home#credits', as: 'credits'
  get '/terms', to: 'home#terms', as: 'terms'

  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
