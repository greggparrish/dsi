# == Schema Information
#
# Table name: lessons
#
#  activities   :text
#  assessment   :text
#  created_at   :datetime         not null
#  id           :integer          not null, primary key
#  image_id     :integer
#  introduction :text
#  objectives   :text
#  question     :string
#  slug         :string
#  standards    :text
#  title        :string
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_lessons_on_image_id  (image_id)
#
# Foreign Keys
#
#  fk_rails_...  (image_id => images.id)
#

class Lesson < ApplicationRecord
  extend FriendlyId
  has_one :header
  belongs_to :image
  accepts_nested_attributes_for :header
  validates :title, :question, :introduction, :image, :activities, presence: true
  friendly_id :title, use: :slugged
end
