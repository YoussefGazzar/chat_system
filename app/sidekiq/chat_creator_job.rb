class ChatCreatorJob
  include Sidekiq::Job

  def perform(application_id, chat_number)
    application = Application.find(application_id)
    return unless application
    application.chats.create(number: chat_number)
  end
end
