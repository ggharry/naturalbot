Rails.application.routes.draw do
  root 'static_pages#index'

  namespace :api do
    namespace :v1 do
      get 'ask' => 'chats#ask'
      resources :intents, only: [:index, :show]
    end
  end
end
