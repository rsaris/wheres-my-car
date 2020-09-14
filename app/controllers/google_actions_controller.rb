class GoogleActionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  EVENT_NAME_CAR_LOCATION = 'car_location'
  EVENT_NAME_FIND_CAR = 'find_car'
  EVENT_NAME_TRACK_CAR = 'track_car'

  def create
    response_text = process_incoming_action

    render json: build_response(response_text)
  end

  private

  def build_response(response_text)
    {
      prompt: {
        override: true,
        firstSimple: { speech: response_text, text: response_text },
      },
    }
  end

  def process_incoming_action
    case handler_name
    when EVENT_NAME_CAR_LOCATION
      process_default
    when EVENT_NAME_FIND_CAR
      process_find_car
    when EVENT_NAME_TRACK_CAR
      process_track_car
    else
      "Sorry, didn't catch that"
    end
  end

  def process_default
    'Welcome to Car Tracker!'
  end

  def process_find_car
    latest_location = ::Locations::FindLatestLocation.run!

    "The car is at #{latest_location}"
  end

  def process_track_car
    ::Locations::LogCarLocation.run!(location: incoming_location)

    "Got it, logging that the car is at #{incoming_location}"
  end

  def handler_name
    params.dig(:handler, :name)
  end

  def incoming_location
    params.dig(:intent, :params, :LOCATION, :resolved)
  end
end
