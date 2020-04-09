Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :workers, only: [:show, :edit, :update] do
    resources :cards, only: [:show, :edit, :update, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "users#index"
end
