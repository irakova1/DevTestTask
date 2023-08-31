Rails.application.routes.draw do
  resources :tasks do 
    member do
      put :complete
    end
    # get 'show', on: :member, as: :show
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tasks#index"

end
