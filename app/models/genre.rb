# == Schema Information
#
# Table name: genres
#
#  created_at  :datetime         not null
#  description :text
#  id          :integer          not null, primary key
#  image       :string
#  playlist_id :string
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
  validates :title, presence: true
  mount_uploader :image, ImagesUploader
  friendly_id :title, use: :slugged
end
