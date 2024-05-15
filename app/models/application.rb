class Application < ApplicationRecord
  has_many :chats, dependent: :destroy

  validates :name, presence: true

  before_validation :generate_unique_token, on: :create

  def generate_next_chat_number
    with_lock do
      value = next_chat_number
      update(next_chat_number: value + 1)
      reload
      value
    end
  end

  private

  def generate_unique_token
    loop do
      self.token = SecureRandom.base58(36)
      break unless self.class.exists?(token:)
    end
  end
end
