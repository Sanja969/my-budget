Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups

  resources :entities, only: %i[new create show] do
    resources :ges, only: %i[new create show index]
  end

  devise_scope :user do
    get '/auth', to: 'devise#auth'
  end
end
