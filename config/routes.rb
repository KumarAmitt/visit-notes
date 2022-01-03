Rails.application.routes.draw do

  resources :patients, only: [:index, :show] do
    resources :plan_of_cares, only: [:index, :show, :new, :create]
    resources :comments, only: [:new, :create, :edit, :update]
    resources :pronunciations, only: [:new, :create]
  end

  resources :goals do
    resources :sub_goals do
      resources :words
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "patients#index"
end
