Rails.application.routes.draw do
  resources :charges, only: [:new, :create]
  resources :wikis do
    resources :collaborators, only [:create, :destroy]
    collection do
      get '/user_wikis', to: 'wikis#user_wikis', as: :user
    end
  end

  get 'downgrade/create'
  get 'home/show'
  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"
end
