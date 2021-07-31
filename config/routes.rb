Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit] do
    resources :book_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
  end

  resources :users
  get 'home/about' => 'homes#about'
  resources :profile_image, only: [:new, :create, :index, :show, :destroy]


  resources :relationships

  end



