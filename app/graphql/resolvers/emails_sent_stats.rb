module Resolvers
  class EmailsSentStats < BaseResolver
    description "Returns the amount of emails sent per email template per 7 days, 7 weeks, 7 months, 7 years"

    argument :stats_filter, Types::StatsFilter, required: true
    argument :email_id, ID, required: false

    type GraphQL::Types::JSON, null: false

    def resolve(stats_filter: nil, email_id: nil)
      logged_in_check

      emails = context[:current_user].emails

      # if given email_id argument, check if email belongs to user
      if !email_id.nil?
        email_ownership_check = emails.pluck(:id).include?(email_id.to_i)

        return GraphQL::ExecutionError.new("email does not belong to current user") if !email_ownership_check
      end

      # check if user has any emails
      return GraphQL::ExecutionError.new("no emails") if emails.empty?

      emails_sent_stats = {}

      # execute different queries depending on value passed to stats_filter
      case stats_filter
        when "DAYS"
          date_range = ((Date.today - 1.week + 1.day)..Date.today.end_of_day)

          emails.each do |email|
            emails_sent_stats[email.id] =
            EmailSent.where(created_at: date_range, user_id: context[:current_user].id, email_id: email.id).group_by_day(:created_at).count
          end
        when "WEEKS"
          date_range = ((Date.today - 7.weeks)..Date.today.end_of_day)

          emails.each do |email|
            emails_sent_stats[email.id] =
            EmailSent.where(created_at: date_range, user_id: context[:current_user].id, email_id: email.id).group_by_week(:created_at).count
          end
        when "MONTHS"
          date_range = ((Date.today - 7.months)..Date.today.end_of_day)

          emails.each do |email|
            emails_sent_stats[email.id] =
            EmailSent.where(created_at: date_range, user_id: context[:current_user].id, email_id: email.id).group_by_month(:created_at).count
          end
        when "YEARS"
          date_range = ((Date.today - 7.years)..Date.today.end_of_day)

          emails.each do |email|
            emails_sent_stats[email.id] =
            EmailSent.where(created_at: date_range, user_id: context[:current_user].id, email_id: email.id).group_by_year(:created_at).count
          end
        else
          return GraphQL::ExecutionError.new("please select a stats filter")
      end
      # return all emails stats or stats for specified email
      email_id.nil? ? emails_sent_stats : emails_sent_stats[email_id.to_i]
    end
  end
end
