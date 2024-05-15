class MessagesController < ApplicationController
  before_action :set_application
  before_action :set_chat
  before_action :set_message, only: %i[show update]

  def index
    @messages = @chat.messages.all

    render json: @messages.as_json(only: %i[number]), status: :ok
  end

  def show
    render json: @message.as_json(except: %i[id chat_id]), status: :ok
  end

  def create
    message_number = @chat.generate_next_message_number
    MessageCreatorJob.perform_async(@application.id, @chat.id, message_params.to_json, message_number)
    render json: { number: message_number }, status: :created
  end

  def update
    return unless @message.update!(message_params)

    render json: @message.as_json(only: %i[number body])
  end

  private

  def set_application
    @application = Application.find_by!(token: params[:application_token])
  end

  def set_chat
    @chat = @application.chats.find_by!(number: params[:chat_number])
  end

  def set_message
    @message = @chat.messages.find_by!(number: params[:number])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
