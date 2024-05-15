class Message < ApplicationRecord
  include Searchable

  belongs_to :chat, counter_cache: true

  validates :number, presence: true, uniqueness: { scope: :chat_id }
  validates :body, presence: true, length: { maximum: 1000 }
end
