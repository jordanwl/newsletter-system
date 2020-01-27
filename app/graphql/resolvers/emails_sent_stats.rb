module Resolvers
  class EmailsSentStats < BaseResolver
    description "Returns the amount of emails sent per email template per 7 days, 7 weeks, 7 months, 7 years"

    argument :stats_filter, Types::StatsFilter, required: true
    argument :email_id, ID, required: false

    type GraphQL::Types::JSON, null: false

    def resolve(stats_filter: nil, email_id: nil)
      logged_in_check

      if !email_id.nil?
        # if given email_id argument, check if email belongs to user
        if !email_ownership_check(email_id)
          return GraphQL::ExecutionError.new("email does not belong to current user")
        end
        emails = Email.where(id: email_id)
      else
        emails = context[:current_user].emails
      end

      # check if user has any emails
      return GraphQL::ExecutionError.new("no emails") if emails.empty?

      date_range = 6.downto(0)
      emails_sent_stats = {}

      # execute different queries depending on value passed to stats_filter
      case stats_filter
        when "DAYS"
          emails.each do |email|
            emails_sent_stats[email.id] = {}
            date_range.each do |date|
              count = email.email_sents.where("created_at < ?", date.days.ago).count

              emails_sent_stats[email.id][date.days.ago] = count
            end
          end
        when "WEEKS"
          emails.each do |email|
            emails_sent_stats[email.id] = {}
            date_range.each do |date|
              count = email.email_sents.where("created_at < ?", date.weeks.ago).count

              emails_sent_stats[email.id][date.weeks.ago] = count
            end
          end
        when "MONTHS"
          emails.each do |email|
            emails_sent_stats[email.id] = {}
            date_range.each do |date|
              count = email.email_sents.where("created_at < ?", date.months.ago).count

              emails_sent_stats[email.id][date.months.ago] = count
            end
          end
        when "YEARS"
          emails.each do |email|
            emails_sent_stats[email.id] = {}
            date_range.each do |date|
              count = email.email_sents.where("created_at < ?", date.years.ago).count

              emails_sent_stats[email.id][date.years.ago] = count
            end
          end
        else
          return GraphQL::ExecutionError.new("please select a stats filter")
        end
      emails_sent_stats
    end

    def email_ownership_check(email_id)
      context[:current_user].emails.pluck(:id).include?(email_id.to_i)
    end
  end
end
