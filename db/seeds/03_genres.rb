if Genre.count < 10 and Rails.env == 'development'
  10.times do
    Genre.create! [
      title: Faker::Book.genre,
      audio: 'https://www.youtube.com/embed/0S7pKtdpQ6s',
      description: Faker::Lorem.paragraphs(rand(6..10)).map{|pr| "<p>#{pr}</p>"}.join,
      image: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
    ]
  end
end

