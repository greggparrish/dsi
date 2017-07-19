class AddModelToHeaders < ActiveRecord::Migration[5.0]
  def change
    add_column :headers, :model, :string
  end
end
