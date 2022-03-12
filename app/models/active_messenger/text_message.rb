module ActiveMessenger
  class TextMessage < Message
    store_accessor :payload, :text

    validates :text, presence: true
  end
end
