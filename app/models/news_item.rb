# == Schema Information
#
# Table name: news_items
#
#  created_at  :datetime         not null
#  date        :date
#  description :text
#  id          :integer          not null, primary key
#  image       :string
#  place       :string
#  slug        :string
#  title       :string
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_news_items_on_slug  (slug) UNIQUE
#

class NewsItem < ApplicationRecord
	extend FriendlyId
  has_one :header
  accepts_nested_attributes_for :header
  mount_uploader :image, ImagesUploader
	friendly_id :slug_candidates, use: :slugged

	def slug_candidates
		[
			:title,
			[:title, :id]
		]
	end


end
