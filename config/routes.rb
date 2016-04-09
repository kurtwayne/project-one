Rails.application.routes.draw do
  devise_for :users

  resources :wikis

  resources :charges

  resources :user

  root 'welcome#index'
end
