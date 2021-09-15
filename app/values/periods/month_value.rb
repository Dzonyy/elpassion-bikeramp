# frozen_string_literal: true

module Periods
  class MonthValue
    attr_reader :start_at, :end_at

    def initialize(date)
      @start_at = date.to_time.beginning_of_month
      @end_at = date.to_time.end_of_month
    end
  end
end
