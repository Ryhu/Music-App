Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :album, only: [:new]

  end
  resources :albums, only: [:create, :update, :edit, :destroy] do
    resources :tracks, only: [:new]
  end
  resources :tracks, only: [:create, :edit, :update, :show, :destroy]
  


end
