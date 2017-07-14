class AddImageToNewsItem < ActiveRecord::Migration[5.0]
  def change
    add_column :news_items, :image, :string
  end
end
