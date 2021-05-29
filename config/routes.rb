Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :projects do
      get :send_invitation
      resources :tickets do 
        post :change_status
      end
    collection do 
      get :accept_invitation
    end
  end 
  get 'login', to: 'sessions#home'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/', to: 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
