Rails.application.routes.draw do
  devise_for :workers
  resources :users
  resources :workers do 
    member do 
      get :reset_password
    end
  end
  resources :roles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
