Rails.application.routes.draw do
  # get 'video/index'

  devise_for :users, controllers: {registrations: 'registrations'}
  resources :user , only:[:index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#resources :video
root 'video#index'
#match '/new', to: 'user#new', via: :get
#match '/user/new', to: 'user#new', via: :get

end
