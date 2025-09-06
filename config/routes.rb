Rails.application.routes.draw do
  devise_for :users
  get 'tweet/list' => 'tweets#list'
  resources :tweets do
   resources :likes, only: [:create, :destroy]
   resources :comments, only: [:create]
  
  end 
   resources :perfumes
  root 'tweets#index'
  get 'users' =>'users#index'
end
