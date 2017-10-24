class AddImageIdToGenre < ActiveRecord::Migration[5.0]
  def change
    add_reference :genres, :image, foreign_key: true
  end
end
