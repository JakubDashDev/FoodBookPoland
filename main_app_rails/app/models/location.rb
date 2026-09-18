class Location < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: [:street, :city] }
  validates :lat, presence: true
  validates :lng, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :cuisine_type, presence: true
  validates :description, presence: true

  def google_maps_link
    return google_maps_url if google_maps_url.present?

    "https://www.google.com/maps/search/?api=1&query=#{lat},#{lng}"
  end
end