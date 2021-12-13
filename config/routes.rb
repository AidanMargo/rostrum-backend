Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
namespace :api do
  
  resources :teachers
  resources :students

  get '/me', to: 'sessions#show'
end
end
