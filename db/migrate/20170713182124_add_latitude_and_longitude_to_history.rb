class AddLatitudeAndLongitudeToHistory < ActiveRecord::Migration[5.0]
  def change
    add_column :histories, :latitude, :float
    add_column :histories, :longitude, :float
  end
end
