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
  mount_uploader :image, StoryImagesUploader
  after_initialize :set_published, if: :new_record?

  private
  def set_published
    self.published ||= false
  end

end

