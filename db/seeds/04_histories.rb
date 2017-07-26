if History.count < 10 and Rails.env == 'development'
  200.times do
    History.create! [
      title: Faker::Lorem.sentence,
      date: Faker::Time.between(10.years.ago, 70.years.ago, :all),
      description: Faker::Lorem.paragraphs(rand(6..10)).map{|pr| "<p>#{pr}</p>"}.join,
      media: 'https://www.youtube.com/watch?v=r454DD4EttY',
      image: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude
    ]
  end
end

