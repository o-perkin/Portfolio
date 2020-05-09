Rails.application.routes.draw do
  resources :portfols, exept: [:show]
  get 'portfol/:id', to: 'portfols#show', as: 'portfol_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'  

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
  
end
