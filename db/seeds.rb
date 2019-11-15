Email.destroy_all
Subscriber.destroy_all
Subscription.destroy_all
Newsletter.destroy_all
User.destroy_all

3.times do |number|
  User.create!(
    username: "jordan#{number}",
    email: "jordan#{number}@test.com",
    password: "password"
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
      content: "Congrats! You've won $#{number}!"
      )
  end
end

50.times do |number|
  Subscription.create!(
    newsletter_id: rand(1..9),
    subscriber_id: (number + 1),
    created_at: Date.today - rand(7).days
    )
end

# generates 20 emailsent (days)
20.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: Email.first.id,
    custom_email: false,
    created_at: (Date.today - rand(7).days)
  )
end

# generates 20 emailsent for 2nd newsletter (days)
20.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: User.first.emails[1].id,
    custom_email: false,
    created_at: (Date.today - rand(7).days)
  )
end

# generates 20 emailsent custom email (days)
20.times do
  EmailSent.create!(
    user_id: User.first.id,
    custom_email: true,
    created_at: (Date.today - rand(7).days)
  )
end

# generates 20 emailsent(weeks)
20.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: Email.first.id,
    custom_email: false,
    created_at: (Date.today - rand(7).weeks)
  )
end

# generates 20 emailsent (month)
20.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: Email.first.id,
    custom_email: false,
    created_at: (Date.today - rand(7).months)
  )
end

# generates 20 emailsent(year)
20.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: Email.first.id,
    custom_email: false,
    created_at: (Date.today - rand(7).years)
  )
end

# generates 5 emailsent (today)
5.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: Email.first.id,
    custom_email: false,
  )
end

puts "Database seeded!"
