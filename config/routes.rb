Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  get 'admins/index'
  get 'parts/index'
  get 'menus/index'
  get 'loads/index'
  get 'trainings/index'
  root  'users#index'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  get 'admins/' => 'admins#index', as: :admins

  namespace :admins do
    resources :users do
      resources :posts
    end
  end

  resources :users do

    member do
      get :following, :followers
    end

    resources :follows
    resources :followers
    resources :posts do
      resources :trainings do
        resources :loads
      end
    end
  end
  
  resources :relationships, only: [:create, :destroy]



  resources :trainings do
    resources :loads
  end

  resources :menus do
    resources :loads
  end

  resources :types
  resources :parts
  resources :loads

  post 'menu_loads_path(@menu)' => 'post#create', as: "ccc"
  post 'users/user_id/posts' => 'post#create', as: "aaa"
  post '/users/:user_id/posts/:id' => 'post#destroy', as: "bbb"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
