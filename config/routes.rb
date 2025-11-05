Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :blogs
  resources :courses

  namespace :admin do 
    resources :students
  end

  resources :students do
    resources :enrollments
  end

  resources :institute, except: [:edit, :update]
  root "welcome#index"
end