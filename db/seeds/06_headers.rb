if Header.count == 0 and Rails.env == 'development'
  allmodels = []
  ActiveRecord::Base.connection.tables.map do |model|
    allmodels << model.capitalize.singularize.camelize
  end
  nopes = ['CacheContainer','SchemaMigration','ArInternalMetadatum','FriendlyIdSlug','ActiveAdminComment','Header']
  models = allmodels-nopes
  models.each do |m|
    Header.create! [
      model: m,
      title: Faker::Lorem.sentence,
      text: Faker::Lorem.paragraphs(rand(1..2)).map{|pr| "<p>#{pr}</p>"}.join,
      image: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
    ]
  end
end

