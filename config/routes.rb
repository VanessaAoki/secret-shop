Rails.application.routes.draw do  
  devise_for :users, :controllers => { registration: 'registrations' }
  
  resources :articles, only: %i[new create destroy show index edit] do 
    resources :votes, only: %i[create destroy]
  end
  
  root 'articles#index'
end