Rails.application.routes.draw do
  devise_for :users

  root to: 'tweets#index'
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users do
    resources :tweets, only: [:index]
  end

end
