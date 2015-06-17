Rails.application.routes.draw do
  root 'categories#index'
  resources :categories, only: :show
  resources :articles, only: :show
end
