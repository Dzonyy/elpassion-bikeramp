# frozen_string_literal: true

class TripsQuery
  include Callee

  option :scope, default: -> { Trip.all }
  option :arel_table, default: -> { Trip.arel_table }

  def call
    scope
  end

  class ForPeriod < TripsQuery
    option :period

    def call
      scope.where(arel_table[:date].gteq(period.start_at)).where(arel_table[:date].lteq(period.end_at))
    end
  end
end
