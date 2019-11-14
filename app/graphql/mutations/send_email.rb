module Mutations
  class SendEmail < BaseMutation
    description "sends an email to all newsletter subscribers given an email_id or to all subscribers given content"

    argument :email_id, ID, required: false
    argument :content, String, required: false

    field :emails_sent, String, null: false

    def resolve(email_id: nil, content: nil)
      logged_in_check

      case
      when !email_id.nil? && !content.nil?
        return GraphQL::ExecutionError.new("enter either an email id or content")

      when !email_id.nil?
        email = Email.find_by(id: email_id)

        return GraphQL::ExecutionError.new("invalid email (check if email exists and if it is your email)") if email.nil? || !email_ownership_check(email_id)

        send_email(email)

        { emails_sent: @@emails_sent}

      when !content.nil?
        send_custom_email(content)

        { emails_sent: @@emails_sent }

      else
        return GraphQL::ExecutionError.new("enter either an email id or content")
      end
    end

    def email_ownership_check(email_id)
      context[:current_user].emails.pluck(:id).include?(email_id.to_i)
    end

    def send_email(email)
      email_sent_counter = 0
      email_recipients = []

      return GraphQL::ExecutionError.new("newsletter has no subscribers") if email.newsletter.subscribers.empty?

      email.newsletter.subscribers.each do |subscriber|
        puts "To: #{subscriber.name},"
        puts "#{email.content}"

        email_recipients << subscriber.name
        email_sent_counter += 1
      end

      email.times_sent += 1

      email.save!

      @@emails_sent = "#{email_sent_counter} email(s) sent (#{email_recipients.join(', ')})"
    end

    def send_custom_email(content)
      email_sent_counter = 0
      subscribers = []

      context[:current_user].newsletters.each do |newsletter|
        subscribers << newsletter.subscribers
      end

      return GraphQL::ExecutionError.new("you have no subscribers") if subscribers.empty?

      subscribers.flatten!.uniq!

      subscribers.each do |subscriber|
        puts "To: #{subscriber.name},"
        puts "#{content}"

        email_sent_counter += 1
      end

      @@emails_sent = "#{email_sent_counter} email(s) sent to your subscribers (#{subscribers.pluck(:name).join(', ')})"
    end
  end
end
