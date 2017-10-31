if Lesson.count < 5 and Rails.env == 'development'
  5.times do
    Lesson.create! [
      title: Faker::Book.title,
      question: Faker::Lorem.sentence,
      introduction: Faker::Lorem.paragraphs(rand(6..10)).map{|pr| "<p>#{pr}</p>"}.join,
      objectives: Faker::Lorem.paragraphs(rand(6..10)).map{|pr| "<p>#{pr}</p>"}.join,
      assessment: Faker::Lorem.paragraphs(rand(6..10)).map{|pr| "<p>#{pr}</p>"}.join,
      image_id: Image.order("Random()").first.id,
      activities: Faker::Lorem.paragraphs(rand(6..10)).map{|pr| "<p>#{pr}</p>"}.join,
      standards: Faker::Lorem.paragraphs(rand(3..6)).map{|pr| "<p>#{pr}</p>"}.join,
    ]
  end
end


