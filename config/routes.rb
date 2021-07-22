Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'

  resources :books, :except => :new

  resources :users

  get 'home/about' => 'homes#about'

end
