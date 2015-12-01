Rails.application.routes.draw do

  resources :categories
  root 'welcome#index'

  resources :articles do 
    resources :comments, only: [:create, :destroy]
  end
  
  devise_for :users



end
