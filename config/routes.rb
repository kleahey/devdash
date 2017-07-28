Rails.application.routes.draw do
  resources :burndown, only: [:index] do
  end
  resources :sprints
  resources :iterations, only: [:index, :show]
  resources :today, only: [:index]
  resources :memes
  resources :sync, only: [:index]
  root 'today#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
