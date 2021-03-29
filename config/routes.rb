Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts do
    post 'like/:id' => 'likes#create', as: 'create_like'
    delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

    resources :comments, only: [:create, :destroy ]
    collection do
      get 'search'
    end
    get 'posts/new', to: 'posts#tag-it'
  end
  resources :users, only: [:show, :edit, :update, :create, :destroy]
end
