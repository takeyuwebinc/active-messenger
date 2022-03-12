class Users::ChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])

    personal_chat = ActiveMessenger::PersonalChat.start([current_user, user])

    redirect_to active_messenger.chat_path(personal_chat)
  end
end
