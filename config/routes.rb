ActiveMessenger::Engine.routes.draw do
  resources :chats, only: %i[index show] do
    resources :text_messages, only: %i[index create], module: :chats
  end

  root "chats#index"
end
