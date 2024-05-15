class ChatsController < ApplicationController
  before_action :set_application
  before_action :set_chat, only: %i[show search]

  def index
    @chats = @application.chats.all

    render json: @chats.as_json(only: %i[number]), status: :ok
  end

  def show
    render json: @chat.as_json(except: %i[id application_id next_message_number]), status: :ok
  end

  def create
    chat_number = @application.generate_next_chat_number
    ChatCreatorJob.perform_async(@application.id, chat_number)
    render json: { number: chat_number }, status: :created
  end

  def search
    query = params[:query]
    result = @chat.messages.search(query)
    render json: result.as_json(only: %i[number body]), status: :ok
  end

  private

  def set_application
    @application = Application.find_by!(token: params[:application_token])
  end

  def set_chat
    number = params[:number] || params[:chat_number]
    @chat = @application.chats.find_by!(number:)
  end
end
