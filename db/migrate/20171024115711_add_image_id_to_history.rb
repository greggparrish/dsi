class AddImageIdToHistory < ActiveRecord::Migration[5.0]
  def change
    add_reference :histories, :image, foreign_key: true
  end
end
