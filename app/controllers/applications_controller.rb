class ApplicationsController < ApplicationController
  before_action :set_application, only: %i[show update]

  def index
    @applications = Application.all

    render json: @applications.as_json(only: %i[token name]), status: :ok
  end

  def show
    render json: @application.as_json(except: %i[id next_chat_number]), status: :ok
  end

  def create
    @application = Application.new(application_params)

    return unless @application.save!

    render json: @application.as_json(only: %i[token name]), status: :created
  end

  def update
    return unless @application.update!(application_params)

    render json: @application.as_json(only: %i[token name]), status: :ok
  end

  private

  def set_application
    @application = Application.find_by!(token: params[:token])
  end

  def application_params
    params.require(:application).permit(:name)
  end
end
