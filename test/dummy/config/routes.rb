Rails.application.routes.draw do
  root "users#index"
  resources :users, only: %i[index show] do
    resources :chats, only: %i[create], module: :users
  end

  devise_for :users, path: :auth

  mount ActiveMessenger::Engine, at: "/messenger", as: "active_messenger"
end
