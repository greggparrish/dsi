if NewsItem.count == 0 and Rails.env == 'development'
  100.times do
    NewsItem.create! [
      title: Faker::Lorem.sentence,
      place: Faker::Address.city+', '+Faker::Address.country,
      date: Faker::Time.between(10.years.ago, 70.years.ago, :all),
      description: Faker::Lorem.paragraphs(rand(6..10)).map{|pr| "<p>#{pr}</p>"}.join,
      image: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
    ]
  end
end



