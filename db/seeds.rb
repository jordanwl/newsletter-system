3.times do |number|
  User.create!(
    username: "jordan#{number}",
    email: "jordan#{number}@test.com",
    password: "password",
    bio: Faker::Lorem.paragraph(sentence_count: 15)
    )
end

50.times do |number|
  Subscriber.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email
    )
end

User.all.each do |user|
  3.times do
    Newsletter.create!(
      user: user,
      name: Faker::Company.unique.buzzword
      )
  end
end

3.times do |number|
  Newsletter.all.each do |newsletter|
    Email.create!(
      newsletter: newsletter,
      content: Faker::Quotes::Shakespeare.romeo_and_juliet_quote
      )
  end
end

# generates subscriptions
Newsletter.all.each do |newsletter|
  50.times do |number|
    Subscription.create!(
      newsletter_id: newsletter.id,
      subscriber_id: (number + 1),
      created_at: rand(7.years.ago..Time.now)
      )
  end
end

# generates 1000 emailsent
1000.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: Email.first.id,
    custom_email: false,
    created_at: rand(7.years.ago..Time.now)
  )
end

# generates 1000 emailsent for 2nd newsletter
100.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: User.first.emails[1].id,
    custom_email: false,
    created_at: rand(7.years.ago..Time.now)
  )
end

# generates 50 emailsent custom email
50.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: User.first.emails[1].id,
    custom_email: true,
    created_at: rand(7.years.ago..Time.now)
  )
end

# have to manually generate subtrackers because the callback method sets all the date to today's date
50.times do
  SubTracker.create!(
    newsletter_id: 1,
    created_at: rand(7.days.ago..Time.now),
    action: "subscribe"
    )
end

puts "Database seeded!"
