# frozen_string_literal: true

module Stats
  class Monthly < Stat
    attr_accessor :total_distance, :date, :avg_ride, :avg_price
  end
end
