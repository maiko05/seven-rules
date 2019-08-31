Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  # get  'rules' => 'rules#index'
  # get  'rules/new' => 'rules#new'
  # post 'rules' => 'rules#create'
  
  resources :users, only: [:edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
  resources :rules do
    resources :likes, only: [:create, :destroy]
  end
end
