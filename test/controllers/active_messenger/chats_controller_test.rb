require "test_helper"

module ActiveMessenger
  class ChatsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get index" do
      get chats_url
      assert_response :success
    end

    test "should get show" do
      chat = chats(:personal_chat)
      get chat_url(chat)
      assert_response :success
    end
  end
end
