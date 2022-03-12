module ActiveMessenger
  class ChatsController < ApplicationController

    def index
      @chats = current_user.active_messenger_chats.includes(:users)
    end

    def show
      @chat = current_user.active_messenger_chats.includes(:users).find(params[:id])
      @messages = @chat.messages
    end
  end
end
