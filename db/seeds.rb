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

9.times do |number|
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

9.times do |number|
  Subscription.create!(
    newsletter_id: (number + 1),
    subscriber_id: rand(1..9)
    )
end

puts "Database seeded!"
