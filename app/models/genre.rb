# == Schema Information
#
# Table name: genres
#
#  audio       :string
#  created_at  :datetime         not null
#  description :text
#  id          :integer          not null, primary key
#  image       :string
#  slug        :string
#  title       :string
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_genres_on_slug  (slug) UNIQUE
#

class Genre < ApplicationRecord
  extend FriendlyId
  has_one :header
  accepts_nested_attributes_for :header
  mount_uploader :image, GenreImagesUploader
  friendly_id :title, use: :slugged
end
