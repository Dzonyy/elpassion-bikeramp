module Api
  class StatsController < ApplicationController
    def weekly
      result = Stats::CalculateWeekly.call

      case result
      when Success
        render json: WeeklyStatsSerializer.call(stats: result.success), status: 201
      when Failure
        render json: result.failure, status: 401
      end
    end

    def monthly
      result = Stats::CalculateMonthly.call

      case result
      when Success
        render json: MonthlyStatsSerializer.call(stats: result.success), status: 201
      when Failure
        render json: result.failure, status: 401
      end
    end
  end
end
