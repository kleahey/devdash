Rails.application.routes.draw do
  resources :today, only: [:index]

  resources :memes

  root 'today#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
