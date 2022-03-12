require "test_helper"

module ActiveMessenger
  class PersonalChatTest < ActiveSupport::TestCase
    test "start with find" do
      taro = users(:taro)
      jiro = users(:jiro)

      personal_chat = PersonalChat.start([jiro, taro])
      assert personal_chat.present?
      assert personal_chat.persisted?
      assert jiro.active_messenger_chats.include?(personal_chat)
      assert taro.active_messenger_chats.include?(personal_chat)
    end

    test "start with create" do
      jiro = users(:jiro)
      hanako = users(:hanako)

      personal_chat = PersonalChat.start([jiro, hanako])
      assert personal_chat.present?
      assert personal_chat.persisted?
      assert jiro.active_messenger_chats.include?(personal_chat)
      assert hanako.active_messenger_chats.include?(personal_chat)
    end

    test "error with same user" do
      taro = users(:taro)

      assert_raise ArgumentError do
        PersonalChat.start([taro, taro])
      end
    end
  end
end
