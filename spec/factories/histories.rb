# == Schema Information
#
# Table name: histories
#
#  created_at  :datetime         not null
#  date        :date
#  description :text
#  id          :integer          not null, primary key
#  image       :string
#  latitude    :float
#  longitude   :float
#  media       :string
#  slug        :string
#  title       :string
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_histories_on_slug  (slug) UNIQUE
#

FactoryGirl.define do
  factory :history do
    title "MyString"
    date "2017-07-13"
    description "MyText"
    media "MyString"
    slug "MyString"
  end
end
