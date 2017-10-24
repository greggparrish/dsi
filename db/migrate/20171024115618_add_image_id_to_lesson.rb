class AddImageIdToLesson < ActiveRecord::Migration[5.0]
  def change
    add_reference :lessons, :image, foreign_key: true
  end
end
