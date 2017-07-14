# == Schema Information
#
# Table name: histories
#
#  created_at  :datetime         not null
#  date        :date
#  description :text
#  id          :integer          not null, primary key
#  image       :string
#  latitude    :float
#  longitude   :float
#  media       :string
#  slug        :string
#  title       :string
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_histories_on_slug  (slug) UNIQUE
#

class History < ApplicationRecord
  extend FriendlyId
	friendly_id :slug_candidates, use: :slugged
	def slug_candidates
		[
			:title,
			[:title, :id]
		]
	end
end
