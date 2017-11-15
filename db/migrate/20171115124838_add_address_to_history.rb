class AddAddressToHistory < ActiveRecord::Migration[5.0]
  def change
    add_column :histories, :address, :string
  end
end
