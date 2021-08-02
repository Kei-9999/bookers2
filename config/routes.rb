Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit] do
    resources :book_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
  end

  resources :users do
    get 'relationships/follow' => "relationships#follow", as: "relationship_follow"
    get 'relationships/follower' => "relationships#follower", as: "relationship_follower"
    resource :relationships
  end


  get 'home/about' => 'homes#about'
  resources :profile_image, only: [:new, :create, :index, :show, :destroy]




  end



