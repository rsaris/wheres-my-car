module Locations
  class LogCarLocation < ActiveInteraction::Base
    record :user, default: User.first
    string :location

    def execute
      car_location = CarLocation.new(
        location: location,
        user: user,
      )

      if car_location.save
        car_location
      else
        errors.merge(car_location.errors)
      end
    end
  end
end
