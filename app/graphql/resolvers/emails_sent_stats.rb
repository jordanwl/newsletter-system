module Resolvers
  class SubscriberCountStats < BaseResolver
    description "Returns the amount of emails sent per template per 7 days, 7 weeks, 7 months, 7 years"
    argument :stats_filter, Types::StatsFilter, required: true

    type GraphQL::Types::JSON, null: false

    def resolve(stats_filter: nil)
      logged_in_check

      emails = c_user.emails
      stats_hash = {}

      case stats_filter
      when "DAYS"
        date_range = ((Date.today - 6.days)..Date.today)
        emails.each do |email|
          stats_hash[email] = {}
          date_range.each do |date|
            stats_hash[email][date] = email.stats
          end
        end
      end
      stats_hash
    end
  end
end
