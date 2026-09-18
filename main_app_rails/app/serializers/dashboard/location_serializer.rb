module Dashboard
  class LocationSerializer < Oj::Serializer
    attributes :id, :name, :cuisine_type, :description

    attribute :address do
      @object.slice(:street, :city, :postal_code, :lat, :lng)
    end
  end
end