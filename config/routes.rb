Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
