class AddIndexToStories < ActiveRecord::Migration[5.0]
  def change
    add_index :stories, :published
  end
end
