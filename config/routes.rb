Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create]

  delete '/logout', to: 'sessions#destroy', as: 'logout'
  # Defines the root path route ("/")
  # root "articles#index"
end
# config/routes.rb

Rails.application.routes.draw do
  

  # Route for sending messages
  post 'chat/send_message', to: 'chat#send_message', as: 'send_message'

  # Route for displaying chat history
  get 'chat/chat_history', to: 'chat#chat_history', as: 'chat_history'
end
