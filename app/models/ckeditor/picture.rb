# == Schema Information
#
# Table name: ckeditor_assets
#
#  created_at        :datetime         not null
#  data_content_type :string
#  data_file_name    :string           not null
#  data_file_size    :integer
#  height            :integer
#  id                :integer          not null, primary key
#  type              :string(30)
#  updated_at        :datetime         not null
#  width             :integer
#
# Indexes
#
#  index_ckeditor_assets_on_type  (type)
#

class Ckeditor::Picture < Ckeditor::Asset
  mount_uploader :data, CkeditorPictureUploader, mount_on: :data_file_name

  def url_content
    url(:content)
  end
end
