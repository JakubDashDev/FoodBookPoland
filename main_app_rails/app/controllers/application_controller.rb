class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do
    render json: { message: "Not found" }, status: :not_found
  end

  rescue_from ActionController::ParameterMissing do
    render json: { message: "Missing required parameter" }, status: :bad_request
  end

  def route_not_found
    render json: { message: "Not found" }, status: :not_found
  end
end
