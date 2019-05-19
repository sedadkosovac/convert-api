Rails.application.routes.draw do
  resources :convert, only: :create
end
