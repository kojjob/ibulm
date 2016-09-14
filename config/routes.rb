Rails.application.routes.draw do
  root 'pics#index'
  resources :pics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
