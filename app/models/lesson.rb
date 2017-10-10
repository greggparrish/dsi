# == Schema Information
#
# Table name: lessons
#
#  activities   :text
#  assessment   :text
#  created_at   :datetime         not null
#  id           :integer          not null, primary key
#  image        :string
#  introduction :text
#  objectives   :text
#  question     :string
#  slug         :string
#  standards    :text
#  title        :string
#  updated_at   :datetime         not null
#

class Lesson < ApplicationRecord
  extend FriendlyId
  has_one :header
  accepts_nested_attributes_for :header
  validates :title, :question, :introduction, :image, :activities, presence: true
  mount_uploader :image, ImagesUploader
  friendly_id :title, use: :slugged
end
