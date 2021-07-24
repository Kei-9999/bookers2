Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'

  resources :books, :except => :new

  resources :users

  get 'home/about' => 'homes#about'

  resources :profile_image, only: [:new, :create, :index, :show, :destroy]

end
