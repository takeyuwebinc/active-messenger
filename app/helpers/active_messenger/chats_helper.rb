module ActiveMessenger
  module ChatsHelper
    def chat_partners(chat)
      chat.users.to_a.filter { |user| user != current_user }
    end

    def chat_partner(chat)
      chat_partners(chat).first
    end

    def chat_name(chat)
      chat_partners(chat).map(&:email).join(", ")
    end
  end
end
