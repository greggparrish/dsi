# == Schema Information
#
# Table name: genres
#
#  audio       :string
#  created_at  :datetime         not null
#  description :text
#  id          :integer          not null, primary key
#  image       :string
#  title       :string
#  updated_at  :datetime         not null
#

class Genre < ApplicationRecord
  mount_uploader :image, GenreImagesUploader
end
