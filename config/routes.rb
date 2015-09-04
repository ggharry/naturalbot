Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'ask' => 'chats#ask'
    end
  end
end
