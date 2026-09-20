module Dashboard
  class ContentCreatorsController < BaseController
    def index
      render json: Dashboard::ContentCreatorSerializer.many(ContentCreator.all), status: :ok
    end

    def show
      render json: Dashboard::ContentCreatorSerializer.one(content_creator), status: :ok
    end

    def create
      content_creator = ContentCreator.new(content_creator_params)

      if content_creator.save
        render json: Dashboard::ContentCreatorSerializer.one(content_creator), status: :created
      else
        render json: { errors: content_creator.errors.full_messages }, status: :unprocessable_content
      end
    end

    def update
      if content_creator.update(content_creator_params)
        render json: Dashboard::ContentCreatorSerializer.one(content_creator), status: :ok
      else 
        render json: { errors: content_creator.errors.full_messages }, status: :unprocessable_content
      end
    end

    def destroy
      if content_creator.destroy
        head :no_content
      else
        render json: { errors: content_creator.errors.full_messages }, status: :unprocessable_content
      end
    end

    private
    def content_creator
      @content_creator ||= ContentCreator.find(params[:id])
    end

    def content_creator_params
      params.require(:content_creator).permit(
        :name,
        :description,
        :profile_picture,
        platforms: [:youtube, :tiktok, :instagram]
      )
    end
  end
end