Rails.application.routes.draw do
  root to: 'pages#front'
  resources :sessions, only: :create
end
