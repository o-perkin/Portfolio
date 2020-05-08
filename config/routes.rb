Rails.application.routes.draw do
  resources :portfols, exept: [:show]
  get 'portfol/:id', to: 'portfols#show', as: 'portfol_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'  

  resources :blogs

  root to: 'pages#home'
  
end
