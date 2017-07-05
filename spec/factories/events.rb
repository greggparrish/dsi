# == Schema Information
#
# Table name: events
#
#  created_at  :datetime         not null
#  date        :date
#  description :text
#  embed       :string
#  id          :integer          not null, primary key
#  image       :string
#  title       :string
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :event do
    date "2017-07-05"
    title "MyString"
    image "MyString"
    description "MyText"
    embed "MyString"
  end
end
