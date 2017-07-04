Rails.application.routes.draw do
  # get 'video/index'

  devise_for :users, controllers: {registrations: 'registrations'}
  resources :user 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#resources :video
root 'video#index'
match '/list', to: 'user#index', via: :get
match '/new', to: 'user#new', via: :get

end
