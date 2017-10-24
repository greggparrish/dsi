class AddImageIdToHeader < ActiveRecord::Migration[5.0]
  def change
    add_reference :headers, :image, foreign_key: true
  end
end
