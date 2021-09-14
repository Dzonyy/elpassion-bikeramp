# frozen_string_literal: true

class TripDecorator < ApplicationDecorator
  delegate_all

  def price_humanized
    "#{object.price.to_f} #{object.price.currency}"
  end

  def distance_humanized
    "#{object.distance} km"
  end

  def date_humanized
    object.date.strftime("%d-%m-%Y")
  end
end
