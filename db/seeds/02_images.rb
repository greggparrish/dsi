if Image.count < 30 and Rails.env == 'development'
  200.times do
    Image.create! [
        title: Faker::Book.title + ' ' + (rand(1..1000)).to_s,
      credit: Faker::Name.name,
      description: Faker::Lorem.paragraphs(rand(6..10)).map{|pr| "<p>#{pr}</p>"}.join,
      file: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample)
    ]
  end
end

