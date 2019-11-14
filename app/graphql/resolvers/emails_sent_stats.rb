module Resolvers
  class EmailsSentStats < BaseResolver
    description "Returns the amount of emails sent per template per 7 days, 7 weeks, 7 months, 7 years"
    argument :stats_filter, Types::StatsFilter, required: true

    type GraphQL::Types::JSON, null: false

    def resolve(stats_filter: nil)
      logged_in_check

      stats_hash = {}

      case stats_filter
        when "DAYS"
          date_range = ((Date.today - 1.week + 1.day)..Date.today.end_of_day)

          EmailSent.where(created_at: date_range, user_id: context[:current_user].id).group(:email_id).group_by_day(:created_at).count
        when "WEEKS"
          date_range = ((Date.today - 7.weeks)..Date.today.end_of_day)

          EmailSent.where(created_at: date_range, user_id: context[:current_user].id).group(:email_id).group_by_week(:created_at).count
        when "MONTHS"
          date_range = ((Date.today - 7.months)..Date.today.end_of_day)

          EmailSent.where(created_at: date_range, user_id: context[:current_user].id).group(:email_id).group_by_month(:created_at).count
        when "YEARS"
          date_range = ((Date.today - 7.days)..Date.today.end_of_day)

          EmailSent.where(created_at: date_range, user_id: context[:current_user].id).group(:email_id).group_by_year(:created_at).count
        else
          return GraphQL::ExecutionError.new("please select a stats filter")
      end
    end
  end
end
