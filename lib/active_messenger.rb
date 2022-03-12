require "active_messenger/version"
require "active_messenger/engine"

module ActiveMessenger
  # Your code goes here...
  mattr_accessor :user_class_name, :root_url

  def self.user_class
    user_class_name.constantize
  end

  def self.decorate_user_class!
    user_class.class_eval do
      has_many :active_messenger_participants, class_name: "ActiveMessenger::Participant", foreign_key: "user_id", dependent: :destroy
      has_many :active_messenger_chats, class_name: "ActiveMessenger::Chat", through: :active_messenger_participants, source: :chat
      has_many :active_messenger_messages, class_name: "ActiveMessenger::Message", through: :active_messenger_participants, source: :messages
    end
  end
end
