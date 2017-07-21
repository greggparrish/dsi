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

FactoryGirl.define do
  factory :header do
    image "MyString"
    title "MyString"
    text "MyText"
    guide "MyString"
    guide_text "MyString"
  end
end
