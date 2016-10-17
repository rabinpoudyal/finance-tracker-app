Rails.application.routes.draw do

  root 'welcome#index'
  resources :user_stocks, except: [:show,:edit,:update]
  #resources :users, only: [:show]
  resources :friendships
  devise_for :users, controllers: { registrations: 'registrations' }

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'

end
