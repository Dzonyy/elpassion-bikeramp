# frozen_string_literal: true

module Periods
  class WeekValue
    attr_reader :start_at, :end_at

    def initialize(date)
      @start_at = date.to_time.beginning_of_week
      @end_at = date.to_time.end_of_week
    end
  end
end
