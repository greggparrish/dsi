if History.count < 10 and Rails.env == 'development'
  lines = File.readlines("stations.csv")
  markers = lines.sample(200)
  markers.each do |m|
    History.create! [
      exclude_from_map: Faker::Boolean.boolean,
      exclude_from_timeline: Faker::Boolean.boolean,
      title: Faker::Lorem.sentence,
      date: Faker::Time.between(10.years.ago, 70.years.ago, :all),
      description: Faker::Lorem.paragraphs(rand(5..8)).map{|pr| "<p>#{pr}</p>"}.join,
      media: 'https://www.youtube.com/watch?v=r454DD4EttY',
      image_id: Image.order("Random()").first.id,
      latitude: m.split(',')[0],
      longitude: m.split(',')[1]
    ]
  end
end


