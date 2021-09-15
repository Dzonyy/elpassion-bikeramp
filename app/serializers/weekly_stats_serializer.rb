class WeeklyStatsSerializer
  include Callee

  option :stats

  def call
    ActiveSupport::JSON.encode(
      {
        total_distance: decorated_stats.total_distance,
        total_price: decorated_stats.total_price
      }
    )
  end

  private

  def decorated_stats
    @decorated_stats ||= StatsDecorator.decorate(stats)
  end
end
