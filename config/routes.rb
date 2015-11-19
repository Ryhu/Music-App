Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: [:new]

  end
  resources :albums, only: [:create, :show, :update, :edit, :destroy] do
    resources :tracks, only: [:new]
  end
  resources :tracks, only: [:create, :edit, :update, :show, :destroy] do
    resources :notes, only: [:create]
  end

end
