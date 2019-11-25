Rails.application.routes.draw do
  get 'favorites/index'
  get 'favorites/destroy'
  get 'favorites/create'
  devise_for :users

  # get 'comments/create'
  # get 'comments/destroy'

  root 'photos#top'

  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      get :photos
    end
    resources :favorites, only: [:index]
  end

  resources :boards, only: [:index, :new, :create, :show, :destroy, :edit, :update]

  resources :comments, only: [:create, :destroy]

  resources :photos, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    get :top, on: :collection
    resource :favorites, only: [:create, :destroy]

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
