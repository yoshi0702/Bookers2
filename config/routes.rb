Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :books
resources :users

root to:'users#top'
get 'home/about' =>'users#about'
end
