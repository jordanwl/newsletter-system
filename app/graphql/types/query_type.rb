module Types
  class QueryType < Types::BaseObject
    field :my_newsletters, resolver: Resolvers::MyNewsletters
    field :my_subscribers, resolver: Resolvers::MySubscribers
    field :my_emails, resolver: Resolvers::MyEmails

    field :subscriber_count_stats, resolver: Resolvers::SubscriberCountStats
    field :custom_email_sent_stats, resolver: Resolvers::CustomEmailSentStats
    field :emails_sent_stats, resolver: Resolvers::EmailsSentStats
  end
end
