Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]

  resources :boards, only: [:index, :new, :create, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
