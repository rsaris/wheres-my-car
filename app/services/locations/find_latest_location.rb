module Locations
  class FindLatestLocation < ActiveInteraction::Base
    record :user, default: User.last

    def execute
      user.car_locations.order(created_at: :desc).first&.location
    end
  end
end
