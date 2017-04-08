class Ville < ActiveRecord::Base
  before_validation :geocode
  
  #fonction pour la meteo
  def meteo 
    ForecastIO.forecast(self.latitude, self.longitude).currently
#     weatherOk = false
#     temperatureOk = false
#     if forecast
#       todayForecast = forecast.currently
#       if todayForecast
#         if todayForecast.summary
#            @weather = todayForecast.summary
#            weatherOk = true
#          end
#          if todayForecast.temperature
#            @temperature = toCelsus(todayForecast.temperature)
#            temperatureOk = true
#         end
#       end
#     end
#     if !weatherOk
#       @weather = "Unavailable"
#     end
#     if !temperatureOk
#       @temperature = "Unavailable"
#     end
  end
  
  
  
  private
  def geocode
    places = Nominatim.search(self.nom).limit(1)
    place = places.first
    self.latitude = place.lat
    self.longitude = place.lon
  end
end


 #faren to cels
#   def toCelsus(fahrenheitTemperature)
#    if fahrenheitTemperature
#     return (fahrenheitTemperature - 32.0) * 5.0 / 9.0
#   else
#    return nil
#    end
#   end