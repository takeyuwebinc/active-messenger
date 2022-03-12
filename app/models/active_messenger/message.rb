module ActiveMessenger
  class Message < ApplicationRecord
    belongs_to :chat
    belongs_to :participant
  end
end
