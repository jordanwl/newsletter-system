module Resolvers
  class SubscriberCountStats < BaseResolver
    description "Returns the amount of subscribers at the end of 7 days, 7 weeks, 7 months, 7 years"
    argument :stats_filter, Types::StatsFilter, required: true

    type GraphQL::Types::JSON, null: false

    def resolve(stats_filter: nil)
      logged_in_check

      c_user = context[:current_user]
      newsletters = c_user.newsletters
      date_range = ((Date.today - 6.days)..Date.today)
      stats_hash = {}

      case stats_filter
      when "DAYS"
        newsletters.each do |newsletter|
          stats_hash[newsletter] = {}
          date_range.each do |date|

            stats_hash[newsletter][date] = (newsletter.subscriptions.where(created_at: date.to_datetime).count
              )
          end
        end
      end
      stats_hash
    end
  end
end
