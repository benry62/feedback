Rails.application.routes.draw do
  resources :homeworks
  resources :class_groups
  resources :presentations
  resources :presentation_items
  resources :students

  resources :homeworks do
    resources :comments
  end

  root to: "homeworks#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
