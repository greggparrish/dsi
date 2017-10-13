if Genre.count < 10 and Rails.env == 'development'
  10.times do
    Genre.create! [
      title: Faker::Book.genre,
      playlist_id: 'PL9441D1E4E8B809AF',
      description: Faker::Lorem.paragraphs(rand(6..10)).map{|pr| "<p>#{pr}</p>"}.join,
      image: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
    ]
  end
end

