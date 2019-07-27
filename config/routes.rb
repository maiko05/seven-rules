Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  # get  'rules' => 'rules#index'
  # get  'rules/new' => 'rules#new'
  # post 'rules' => 'rules#create'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :users, only: [:edit, :update] do
    resources :likes, only: [:create, :destroy]
  end
  resources :rules do
    resources :likes, only: [:create, :destroy]
  end
end
