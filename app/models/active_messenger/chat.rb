module ActiveMessenger
  class Chat < ApplicationRecord
    has_many :participants, dependent: :destroy
    has_many :users, through: :participants, source: :user
    has_many :messages, dependent: :destroy

    scope :personals, -> { merge(PersonalChat.all) }
    scope :groups, -> { merge(GroupChat.all) }

    def self.start(users)
      raise ArgumentError if users.length != users.uniq.length

      query = users.inject(joins(:participants)) do |q, user|
        q.merge(user.active_messenger_participants)
      end
      chat = query.first

      return chat if chat

      create(users: users)
    end
  end
end
