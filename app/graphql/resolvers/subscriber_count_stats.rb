module Resolvers
  class SubscriberCountStats < BaseResolver
    description "Returns the number of subscribers after 7 days, 7 weeks, 7 months and 7 years"

    argument :stats_filter, Types::StatsFilter, required: true
    argument :newsletter_id, ID, required: false

    type GraphQL::Types::JSON, null: false

    def resolve(stats_filter: nil, newsletter_id: nil)
      logged_in_check

      newsletters = Newsletter.where(user_id: context[:current_user].id)

      # if given newsletter_id argument, check if newsletter belongs to user
      if !newsletter_id.nil?
        newsletter_ownership_check = newsletters.pluck(:id).include?(newsletter_id.to_i)

        return GraphQL::ExecutionError.new("newsletter does not belong to current user") if !newsletter_ownership_check

        newsletter = Newsletter.find(newsletter_id)
      end

      # check if user has any newsletters
      return GraphQL::ExecutionError.new("no newsletters") if newsletters.empty?

      sub_count_stats = {}

      # execute different queries depending on value passed to stats_filter
      case stats_filter
        when "DAYS"
          date_range = ((Date.today - 1.week + 1.day)..Date.today.end_of_day)

          newsletters.each do |newsletter|
            sub_count_stats["#{newsletter.name}, id: #{newsletter.id}"] =
            Subscription.where(created_at: date_range, newsletter_id: newsletter.id).group_by_day(:created_at).count
          end
        when "WEEKS"
          date_range = ((Date.today - 7.weeks)..Date.today.end_of_day)

          newsletters.each do |newsletter|
            sub_count_stats["#{newsletter.name}, id: #{newsletter.id}"] =
            Subscription.where(created_at: date_range, newsletter_id: newsletter.id).group_by_weeks(:created_at).count
          end
        when "MONTHS"
          date_range = ((Date.today - 7.months)..Date.today.end_of_day)

          newsletters.each do |newsletter|
            sub_count_stats["#{newsletter.name}, id: #{newsletter.id}"] =
            Subscription.where(created_at: date_range, newsletter_id: newsletter.id).group_by_month(:created_at).count
          end
        when "YEARS"
          date_range = ((Date.today - 7.years)..Date.today.end_of_day)

          newsletters.each do |newsletter|
            sub_count_stats["#{newsletter.name}, id: #{newsletter.id}"] =
            Subscription.where(created_at: date_range, newsletter_id: newsletter.id).group_by_year(:created_at).count
          end
        else
          return GraphQL::ExecutionError.new("please select a stats filter")
      end
      # return all subscriber stats or stats for specified newsletter
      newsletter_id.nil? ? sub_count_stats : sub_count_stats["#{newsletter.name}, id: #{newsletter.id}"]
    end
  end
end
