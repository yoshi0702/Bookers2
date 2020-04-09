Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :books do
resource :book_comments, only: [:create, :destroy]
resource :favorites, only: [:create, :destroy]
end

resources :users

root to:'users#top'
get 'home/about' =>'users#about'
end
