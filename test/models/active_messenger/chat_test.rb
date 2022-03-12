require "test_helper"

module ActiveMessenger
  class ChatTest < ActiveSupport::TestCase
    test "create" do
      chat = active_messenger_chats(:personal_chat)
      assert chat.persisted?
    end
  end
end
