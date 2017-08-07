if History.count < 10 and Rails.env == 'development'
  lines = File.readlines("stations.csv")
  markers = lines.sample(200)
  markers.each do |m|
    History.create! [
      exclude_from_map: Faker::Boolean.boolean,
      exclude_from_timeline: Faker::Boolean.boolean,
      title: Faker::Lorem.sentence,
      date: Faker::Time.between(10.years.ago, 70.years.ago, :all),
      description: Faker::Lorem.paragraphs(rand(6..10)).map{|pr| "<p>#{pr}</p>"}.join,
      media: 'https://www.youtube.com/watch?v=r454DD4EttY',
      image: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
      latitude: m[0],
      longitude: m[1]
    ]
  end
end


