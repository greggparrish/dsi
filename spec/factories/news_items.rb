# == Schema Information
#
# Table name: news_items
#
#  created_at  :datetime         not null
#  date        :date
#  description :text
#  id          :integer          not null, primary key
#  image       :string
#  place       :string
#  slug        :string
#  title       :string
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_news_items_on_slug  (slug) UNIQUE
#

FactoryGirl.define do
  factory :news_item do
    title "MyString"
    place "MyString"
    date "2017-07-14"
    description "MyText"
    slug "MyString"
  end
end
