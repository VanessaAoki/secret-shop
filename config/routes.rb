Rails.application.routes.draw do  
  devise_for :users, :controllers => { registration: 'registrations' }
 
  resources :users, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :articles, only: %i[new create destroy show index edit] do 
    resources :votes, only: %i[create destroy]
  end
  
  root 'articles#index'
end