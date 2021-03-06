Rails.application.routes.draw do
  resources :topics, only: [:index, :show]

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfols, exept: [:show] do
    put :sort, on: :collection
  end
  get 'portfol/:id', to: 'portfols#show', as: 'portfol_show'

  get 'angular-items', to: 'portfols#angular'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'  

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable'

  root to: 'pages#home'
  
end