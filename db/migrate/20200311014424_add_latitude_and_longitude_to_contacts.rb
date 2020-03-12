class AddLatitudeAndLongitudeToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :latitude, :integer
  end
end
