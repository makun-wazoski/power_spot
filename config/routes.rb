Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts do
    post 'like/:id' => 'likes#create', as: 'create_like'
    delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  # resources :likes, only: [:create, :destroy]

    resources :comments, only: [:create, :destroy ]
    # resources :likes
    collection do
      get 'search'
      # get 'post#tag-it'
    end
    get 'posts/new', to: 'posts#tag-it'
    # resources :posts, expect: [:index] do
    #   get 'get_tag_search', on: :collection, defaults: { format: 'json' }
    #   get 'get_tag_search', on: :member, defaults: { format: 'json' }
    # end
  end
  resources :users, only: [:show, :edit, :update, :create, :destroy]
end
