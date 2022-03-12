require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "create" do
    user = users(:taro)
    assert user.persisted?
  end

  test "リレーションを追加されていること" do
    user = users(:taro)
    chat = user.active_messenger_chats.personals.create
    assert chat.persisted?

    assert user.active_messenger_messages.any?
  end
end
