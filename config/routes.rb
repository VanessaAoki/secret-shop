Rails.application.routes.draw do  
  devise_for :users, :controllers => { registration: 'registrations' }
 
  resources :users, only: %i[index show]
  resources :categories, only: %i[show new create index]
  resources :articles, only: %i[new create update destroy show index edit] do 
    resources :votes, only: %i[index create destroy]
  end

  root 'articles#index'
end