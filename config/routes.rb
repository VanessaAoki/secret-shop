Rails.application.routes.draw do
  get 'vote/create'
  get 'vote/destroy'
  get 'user/show'
  devise_for :users,  :controllers  => { registrations: 'registrations' }

  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
