if Header.count == 0 and Rails.env == 'development'
	cons = Rails.application.routes.routes.map do |route|
		route.defaults[:controller]
	end.uniq
	cons = cons.compact.select { |c| !c['/'] }

	cons.each do |c|
		Header.create! [
			modelname: c.singularize,
			title: Faker::Lorem.sentence,
			text: Faker::Lorem.paragraphs(rand(1..2)).map{|pr| "<p>#{pr}</p>"}.join,
			image: File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample),
		]
	end
end

