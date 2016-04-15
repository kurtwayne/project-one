Rails.application.routes.draw do
  devise_for :users

  resources :wikis

  resources :charges

  resources :users

  root :to => "welcome#index"
end
