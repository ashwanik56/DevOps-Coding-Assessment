// app/assets/javascripts/channels/chat.js

App.chat = App.cable.subscriptions.create("ChatChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      // Handle incoming messages
      var chatMessages = document.getElementById('chat-messages');
      var message = document.createElement('div');
      message.className = 'message';
      message.innerHTML = '<strong>' + data.user + ':</strong> ' + data.message;
      chatMessages.appendChild(message);
    },
    sendMessage: function(message) {
      return this.perform('send_message', { message: message });
    }
  });
  