module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :handle_standard_error
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid
    rescue_from ActionController::ParameterMissing, with: :handle_parameter_missing
  end

  private

  def handle_standard_error(e)
    render json: { error: e.message }, status: :internal_server_error
  end

  def handle_record_not_found(e)
    model_name = e.model.constantize.model_name.human
    render json: { error: "#{model_name} with that identifier doesn't exist" }, status: :not_found
  end

  def handle_record_invalid(e)
    render json: { error: e.record.errors.full_messages.to_sentence }, status: :unprocessable_entity
  end

  def handle_parameter_missing(e)
    render json: { error: e.message }, status: :bad_request
  end
end
