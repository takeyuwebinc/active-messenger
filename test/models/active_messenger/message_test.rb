require "test_helper"

module ActiveMessenger
  class MessageTest < ActiveSupport::TestCase
    test "create" do
      message = active_messenger_messages(:text_message)
      assert message.chat.persisted?
      assert message.participant.persisted?
    end
  end
end
