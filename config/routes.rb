Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  get 'home/index'
  resources :homeworks
  resources :class_groups
  resources :presentations
  resources :presentation_items
  resources :students

  resources :homeworks do
    resources :comments
  end

  root "home#index"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # root to: "homeworks#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
