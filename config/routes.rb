Rails.application.routes.draw do
  resources :class_groups
  resources :comments
  resources :presentations
  resources :presentation_items
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
