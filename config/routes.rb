Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :pics do 
    resources :comments
    member do
      put "like", to: "pics#upvote"
    end
  end
  root 'pics#index'
  get ':user_name', to: 'profiles#show', as: :profile
end
