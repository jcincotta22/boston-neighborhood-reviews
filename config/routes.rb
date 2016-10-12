Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'microhoods#index'
  namespace :api do
    resources :microhoods do
      resources :reviews
    end
  end

  resources :microhoods do
    resources :reviews
  end
end
