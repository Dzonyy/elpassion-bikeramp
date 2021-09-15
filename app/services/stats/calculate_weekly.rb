# frozen_string_literal: true

module Stats
  class CalculateWeekly < ApplicationService
    def call
      return Failure(messages: I18n.t('services.no_trips_in_current_week')) if trips.blank?

      Success(stats)
    end

    private

    def stats
      Stats::Weekly.new(
        total_distance: trips.sum(:distance),
        total_price: trips.sum(:price_subunit) / 100
      )
    end

    def period
      @period ||= ::Periods::WeekValue.new(Time.zone.now)
    end

    def trips
      @trips ||= ::TripsQuery::ForPeriod.call(period: period)
    end
  end
end
