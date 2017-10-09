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
  has_one :header
  accepts_nested_attributes_for :header
  validates :title, :file,  presence: true
  mount_uploader :file, ImagesUploader
  friendly_id :title, use: :slugged
end
