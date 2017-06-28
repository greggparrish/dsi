class Story < ApplicationRecord
  mount_uploader :image, UserImagesUploader
  after_initialize :set_published, if: :new_record?

  private
  def set_published
    self.published ||= false
  end

end

