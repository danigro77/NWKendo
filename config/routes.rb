Rails.application.routes.draw do

  root to: 'home#landing'
  resources :users
  resources :images
  resources :photographers
  resources :resources
  resources :meetings
  resources :categories
  resources :questions, except: [:show] do
    member do
      put 'change_position/:direction', to: 'questions#change_position', as: 'change_position'
    end
  end

  # MANAGE
  get '/manage', to: 'home#manage', as: 'manage'
  scope :manage do
    get 'images/:type', to: 'images#manage', as: 'manage_images'
    get '/new_image_for/:type', to: 'images#new_image', as: 'manage_new_image'
    get 'photographers', to: 'photographers#manage', as: 'manage_photographers'
    get 'questions', to: 'questions#manage', as: 'manage_questions'
    get 'resources', to: 'resources#manage', as: 'manage_resources'
    get 'categories', to: 'categories#manage', as: 'manage_categories'
    get 'users', to: 'users#manage', as: 'manage_users'
    get 'meetings', to: 'meetings#manage', as: 'manage_meetings'
  end

  # HOME
  get '/faq', to: 'home#faq', as: 'faq'
  get '/credits', to: 'home#credits', as: 'credits'
  get '/terms', to: 'home#terms', as: 'terms'
  get '/map', to: 'home#map', as: 'map'
  get '/schedule/:date', to: 'home#schedule', as: 'schedule'


  # SESSION
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
