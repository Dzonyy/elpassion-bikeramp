class MonthlyStatsSerializer
  include Callee

  option :stats

  def call
    ActiveSupport::JSON.encode(
      serialized_stats
    )
  end

  private

  def serialized_stats
    decorated_stats.map do |stat|
      {
        date: stat.date,
        total_distance: stat.total_distance,
        avg_ride: stat.avg_ride,
        avg_price: stat.avg_price
      }
    end
  end

  def decorated_stats
    @decorated_stats ||= StatsDecorator.decorate_collection(stats)
  end
end
