Rails.application.routes.draw do

  resources :patients, only: [:index, :show]

  resources :goals do
    resources :sub_goals do
      resources :words
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "patients#index"
end
