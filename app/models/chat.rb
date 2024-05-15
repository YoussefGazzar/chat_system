class Chat < ApplicationRecord
  belongs_to :application, counter_cache: true
  has_many :messages, dependent: :destroy

  validates :number, presence: true, uniqueness: { scope: :application_id }

  def generate_next_message_number
    with_lock do
      value = next_message_number
      update(next_message_number: value + 1)
      reload
      value
    end
  end
end
