Rails.application.routes.draw do
  get 'video/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#resources :video
root 'video#index'
end
