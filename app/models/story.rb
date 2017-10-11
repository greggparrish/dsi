# == Schema Information
#
# Table name: stories
#
#  created_at :datetime         not null
#  email      :string
#  id         :integer          not null, primary key
#  image      :string
#  name       :string
#  place      :string
#  published  :boolean
#  story_text :text
#  updated_at :datetime         not null
#

class Story < ApplicationRecord
  mount_uploader :image, ImagesUploader
  has_one :header
  validates :email, :name, :place, :story_text, presence: true
  accepts_nested_attributes_for :header
  after_initialize :set_published, if: :new_record?

  private
  def set_published
    self.published ||= false
  end

end

