# == Schema Information
#
# Table name: headers
#
#  created_at :datetime         not null
#  guide      :string
#  guide_text :string
#  id         :integer          not null, primary key
#  image      :string
#  modelname  :string
#  text       :text
#  title      :string
#  updated_at :datetime         not null
#

class Header < ApplicationRecord
  mount_uploader :image, HeadersUploader
end
