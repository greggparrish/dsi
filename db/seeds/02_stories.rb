if Story.count < 30 and Rails.env == 'development'
  100.times do
    Story.create! [
      email: Faker::Internet.safe_email,
      name: Faker::Name.name,
      published: Faker::Boolean.boolean,
      place: Faker::Address.city+', '+Faker::Address.country,
      story_text: Faker::Lorem.paragraph,
      image: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
    ]
  end
end
