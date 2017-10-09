if Image.count < 10 and Rails.env == 'development'
  100.times do
    Image.create! [
      title: Faker::Book.title,
      credit: Faker::Book.name,
      description: Faker::Lorem.paragraphs(rand(6..10)).map{|pr| "<p>#{pr}</p>"}.join,
      file: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
    ]
  end
end

