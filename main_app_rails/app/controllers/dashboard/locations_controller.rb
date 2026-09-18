module Dashboard
  class LocationsController < BaseController
    def index
      render json: Dashboard::LocationSerializer.many(Location.all)
    end

    def show
      render json: Dashboard::LocationSerializer.one(location)
    end

    def create
      location = Location.new(location_params)

      if location.save
        render json: Dashboard::LocationSerializer.one(location), status: :created
      else
        render json: { errors: location.errors.full_messages }, status: :unprocessable_content
      end
    end

    def update
      if location.update(location_params)
        render json: Dashboard::LocationSerializer.one(location), status: :ok
      else
        render json: { errors: location.errors.full_messages }, status: :unprocessable_content
      end
    end

    def destroy 
      if location.destroy
        head :no_content
      else
        render json: { errors: location.errors.full_messages }, status: :unprocessable_content
      end
    end

    private
    def location_params
      params.require(:location).permit(
        :name,
        :cuisine_type,
        :description,
        :street,
        :city,
        :postal_code,
        :lat,
        :lng
      )
    end

    def location
      @location ||= Location.find(params[:id])
    end
  end
end