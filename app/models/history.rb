# == Schema Information
#
# Table name: histories
#
#  address               :string
#  created_at            :datetime         not null
#  date                  :date
#  description           :text
#  exclude_from_map      :boolean          default(FALSE)
#  exclude_from_timeline :boolean          default(FALSE)
#  id                    :integer          not null, primary key
#  image_id              :integer
#  latitude              :float
#  longitude             :float
#  media                 :string
#  slug                  :string
#  title                 :string
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_histories_on_image_id  (image_id)
#  index_histories_on_slug      (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (image_id => images.id)
#

class History < ApplicationRecord
  extend FriendlyId
  has_one :header
  belongs_to :image
  validates :title, :description, presence: true
  accepts_nested_attributes_for :header
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  friendly_id :slug_candidates, use: :slugged
  def slug_candidates
      [
        :title,
        [:title, :id]
      ]
  end
end
