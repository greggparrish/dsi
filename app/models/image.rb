# == Schema Information
#
# Table name: images
#
#  created_at  :datetime         not null
#  credit      :string
#  description :text
#  file        :string
#  id          :integer          not null, primary key
#  slug        :string
#  title       :string
#  updated_at  :datetime         not null
#

class Image < ApplicationRecord
  extend FriendlyId
  has_many :genres
  has_many :lessons
  has_many :histories
  has_many :headers
  validates :title, :file,  presence: true
  mount_uploader :file, ImagesUploader
  friendly_id :title, use: :slugged
end
