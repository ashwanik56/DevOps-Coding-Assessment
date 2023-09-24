class ChatController < ApplicationController
    before_action :authenticate_user! # Assuming you're using Devise for authentication
  
    def send_message
      message = current_user.chat_messages.create(content: params[:message])
      
      ActionCable.server.broadcast(
        'chat_channel',
        user: message.user.email,
        message: message.content
      )
  
      head :ok
    end
      
      redirect_to chat_history_path
    end
  
    def chat_history
      @chat_messages = ChatMessage.all # Adjust this query to fetch the chat history you need
    end
  end
  