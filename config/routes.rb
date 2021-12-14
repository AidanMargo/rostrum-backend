Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
namespace :api do
  
  resources :teachers
  resources :students

  get '/me', to: 'sessions#show'
  post '/studentlogin', to: 'sessions#create'
  post '/teacherlogin', to: 'sessions#teacher_create'

end
end
