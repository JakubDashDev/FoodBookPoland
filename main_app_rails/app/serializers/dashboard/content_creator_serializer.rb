module Dashboard 
  class ContentCreatorSerializer < Oj::Serializer
    attributes :id, :name, :description, :platforms

    attribute :profile_picture do
      next nil unless @object.profile_picture.attached?

      Rails.application.routes.url_helpers.url_for(@object.profile_picture)
    end
  end
end