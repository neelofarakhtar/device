Rails.application.routes.draw do
  
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
      root 'users#index'
  resources :users do
    collection do
      post :import
    end
  end
  post '/create_user', to: "users#create_user" 
end
