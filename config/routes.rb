Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :users, only: [:index, :show]
  root "pages#index"

  get '/index', to: "pages#index"
  get '/contacts', to: "pages#contact"
  get '/eat_eyes', to: "recipes#eat_eyes"

  resources :recipes do
    member do
      get "like", to: "recipes#upvote"
      get "dislike", to: "recipes#downvote" 
    end
  end
  resources :posts
  resources :categories, only: [:new, :create, :show]

  resources :searches

  # TheComments routes
  concern   :user_comments,  TheComments::UserRoutes.new
  concern   :admin_comments, TheComments::AdminRoutes.new
  resources :comments, concerns:  [:user_comments, :admin_comments]
end
