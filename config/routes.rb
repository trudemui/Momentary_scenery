Rails.application.routes.draw do
  # get 'comments/create'
  # get 'comments/destroy'
  devise_for :users

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :boards, only: [:index, :new, :create, :show, :destroy, :edit, :update]

  resources :comments, only: [:create, :destroy]

  resources :photos, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    get :top, on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
