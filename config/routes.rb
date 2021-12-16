Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'about', to: 'homes#about'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  
  resources :users, only: [:index, :show, :edit, :update]
end

