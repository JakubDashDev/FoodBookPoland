class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do
    render json: { message: "Not found" }, status: :not_found
  end

  def route_not_found
    render json: { message: "Not found" }, status: :not_found
  end
end
