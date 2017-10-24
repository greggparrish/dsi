# == Schema Information
#
# Table name: genres
#
#  created_at  :datetime         not null
#  description :text
#  id          :integer          not null, primary key
#  image_id    :integer
#  playlist_id :string
#  slug        :string
#  title       :string
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_genres_on_image_id  (image_id)
#  index_genres_on_slug      (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (image_id => images.id)
#

class Genre < ApplicationRecord
  extend FriendlyId
  has_one :header
  belongs_to :image
  accepts_nested_attributes_for :header
  validates :title, presence: true
  friendly_id :title, use: :slugged
end
