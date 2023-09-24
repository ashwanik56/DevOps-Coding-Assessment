// app/assets/javascripts/channels/chat.js

App.chat = App.cable.subscriptions.create("ChatChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      // Handle incoming messages, e.g., append them to the chat window.
    },
    sendMessage: function(message) {
      return this.perform('send_message', { message: message });
    }
  });
  