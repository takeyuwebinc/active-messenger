module ActiveMessenger
  class Participant < ApplicationRecord
    belongs_to :user, class_name: ActiveMessenger.user_class_name
    belongs_to :chat
    has_many :messages, dependent: :destroy
  end
end
