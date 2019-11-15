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

20.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: Email.first.id,
    custom_email: false,
    created_at: (Date.today - rand(7).days)
  )
end

20.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: User.first.emails[1].id,
    custom_email: false,
    created_at: (Date.today - rand(7).days)
  )
end


20.times do
  EmailSent.create!(
    user_id: User.first.id,
    custom_email: true,
    created_at: (Date.today - rand(7).days)
  )
end

20.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: Email.first.id,
    custom_email: false,
    created_at: (Date.today - rand(7).weeks)
  )
end

20.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: Email.first.id,
    custom_email: false,
    created_at: (Date.today - rand(7).months)
  )
end

20.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: Email.first.id,
    custom_email: false,
    created_at: (Date.today - rand(7).years)
  )
end

5.times do
  EmailSent.create!(
    user_id: User.first.id,
    email_id: Email.first.id,
    custom_email: false,
  )
end

puts "Database seeded!"
