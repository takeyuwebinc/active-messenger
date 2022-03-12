module ActiveMessenger::Chats
  class TextMessagesController < ApplicationController
    before_action :set_chat

    def index
      @chats = current_user.active_messenger_chats.includes(:users)
    end

    def new
      @message = build_message({text: ""})
    end

    def create
      message = build_message
      if message.save
        redirect_to chat_url(@chat)
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def set_chat
      @participant = current_user.active_messenger_participants.find_by!(chat_id: params[:chat_id])
      @chat = @participant.chat
    end

    def permitted_text_message_params
      params.require(:text_message).permit(:text)
    end

    def build_message(text_message_params=permitted_text_message_params)
      ActiveMessenger::TextMessage.new(
        chat: @chat,
        participant: @participant,
        text: text_message_params[:text]
      )
    end
  end
end
