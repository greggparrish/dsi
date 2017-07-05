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

class Event < ApplicationRecord
end
