Rails.application.routes.draw do
  resources :categories
  get 'static_pages/home'

  get 'static_pages/help'
  get 'static_pages/about'


  # get 'video/index'

  devise_for :users, controllers: {registrations: 'registrations'}
  resources :user 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#resources :video
# root 'video#index'
root to: 'static_pages#home'
match '/list', to: 'user#index', via: :get
match '/new', to: 'user#new', via: :get


match '/help', to: 'static_pages#help', via: :get

match '/about', to: 'static_pages#about', via: :get

match '/categories', to: 'categories#show', via: :get


end
