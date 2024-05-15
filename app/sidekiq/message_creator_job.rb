class MessageCreatorJob
  include Sidekiq::Job

  def perform(application_id, chat_id, message_params, message_number)
    application = Application.find(application_id)
    chat = application&.chats&.find(chat_id)
    return unless chat

    message_params = JSON.parse(message_params)
    message_params['number'] = message_number
    chat.messages.create(message_params)
  end
end
