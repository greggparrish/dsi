# == Schema Information
#
# Table name: headers
#
#  created_at :datetime         not null
#  guide      :string
#  guide_text :string
#  id         :integer          not null, primary key
#  image_id   :integer
#  modelname  :string
#  text       :text
#  title      :string
#  updated_at :datetime         not null
#
# Indexes
#
#  index_headers_on_image_id  (image_id)
#
# Foreign Keys
#
#  fk_rails_...  (image_id => images.id)
#

class Header < ApplicationRecord
  belongs_to :image
  mount_uploader :guide, PdfUploader
  validates :image, presence: true
end
