Rails.application.routes.draw do
  resources :spices
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :spices, only: [:index, :create, :update, :destroy]
  
end

