require "test_helper"

module ActiveMessenger
  class TextMessageTest < ActiveSupport::TestCase
    test "text" do
      text_message = active_messenger_messages(:text_message)
      assert_equal "Hello", text_message.text
    end
  end
end
