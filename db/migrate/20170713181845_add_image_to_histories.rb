class AddImageToHistories < ActiveRecord::Migration[5.0]
  def change
    add_column :histories, :image, :string
  end
end
