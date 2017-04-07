class Ville < ActiveRecord::Base
  before_validation :geocode
  
  private
  def geocode
    places = Nominatim.search(self.nom).limit(1)
    place = places.first
    self.latitude = place.lat
    self.longitude = place.lon
  end
end
