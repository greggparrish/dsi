class AddIndexToLessons < ActiveRecord::Migration[5.0]
  def change
    add_index :lessons, :created_at
    add_index :lessons, :title
  end
end
