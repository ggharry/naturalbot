Rails.application.routes.draw do
  root 'static_pages#index'

  namespace :api do
    namespace :v1 do
      get 'ask' => 'chats#ask'
    end
  end
end
