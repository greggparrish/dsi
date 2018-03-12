class AddIndexToHistories < ActiveRecord::Migration[5.0]
  def change
    add_index :histories, :date
  end
end
