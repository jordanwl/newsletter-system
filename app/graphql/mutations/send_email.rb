module Mutations
  class SendEmail < BaseMutation
    description "sends an email to all newsletter subscribers given an email_id"
    argument :email_id, ID, required: true

    field :email, Types::EmailType, null: false
    field :emails_sent, String, null: false

    def resolve(email_id: nil)
      email = Email.find_by(id: email_id)

      return GraphQL::ExecutionError.new("invalid email (check if email exists and if it is your email)") if email.nil? || !email_ownership_check(email_id)

      send_email(email)

      { email: email, emails_sent: @@emails_sent}
    end

    def email_ownership_check(email_id)
      context[:current_user].emails.pluck(:id).include?(email_id.to_i)
    end

    def send_email(email)
      email_sent_counter = 0
      email_recipients = []

      email.newsletter.subscribers.each do |subscriber|
        puts "#{subscriber.name}, #{email.content}"
        email_recipients << subscriber.name
        email_sent_counter += 1
      end

      @@emails_sent = "#{email_sent_counter} email(s) sent (#{email_recipients.join(', ')})"
    end

  end
end
