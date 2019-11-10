5.times do 
  User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password)
end

CrochetPattern.create!(title: 'The Doggy Sweater Size Medium', body: 'The Doggy Sweater in size medium is for dogs 18-28lbs', link: 'https://crochetitcreations.com/the-doggy-sweater-size-medium/', size: "Medium", user_id: 0)