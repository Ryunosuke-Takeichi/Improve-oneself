Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  get 'my_calendar', to: 'events#my_calendar'
  resources :tweets do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create, :show]
  resources :users, only: [:show, :index, :edit, :update] do
    resources :events
    resources :weight_records
    member do
      get :following, :followers
    end
  end
  resources :follow_relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
