Rails.application.routes.draw do

  # devise_for :users, controllers: {
  # 	sessions: 'users/sessions',
  # 	registrations: 'users/registrations'
  # }

  devise_for :users
  root 'books#top'
  post 'books/:id' => 'books#create'
  get 'home/about' => 'books#top'

  resources :books
  resources :users, only: [:show, :edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
