module Resolvers
  class CustomEmailSentStats < BaseResolver
    description "Returns the amount of custom emails sent per 7 days, 7 weeks, 7 months, 7 years"

    argument :stats_filter, Types::StatsFilter, required: true

    type GraphQL::Types::JSON, null: false

    def resolve(stats_filter: nil)
      logged_in_check

      date_range = 6.downto(0)
      emails_sent_stats = {}

      case stats_filter
        when "DAYS"
          date_range.each do |date|
            count = EmailSent.where("custom_email = ? AND created_at < ? AND user_id = ?", true, date.days.ago, context[:current_user].id).count

            emails_sent_stats[date.days.ago] = count
          end
        when "WEEKS"
          date_range.each do |date|
            count = EmailSent.where("custom_email = ? AND created_at < ? AND user_id = ?", true, date.days.ago, context[:current_user].id).count

            emails_sent_stats[date.days.ago] = count
          end

        when "MONTHS"
          date_range.each do |date|
            count = EmailSent.where("custom_email = ? AND created_at < ? AND user_id = ?", true, date.days.ago, context[:current_user].id).count

            emails_sent_stats[date.days.ago] = count
          end
        when "YEARS"
         date_range.each do |date|
           count = EmailSent.where("custom_email = ? AND created_at < ? AND user_id = ?", true, date.days.ago, context[:current_user].id).count

           emails_sent_stats[date.days.ago] = count
          end
        else
          return GraphQL::ExecutionError.new("please select a stats filter")
      end
      emails_sent_stats
    end
  end
end
