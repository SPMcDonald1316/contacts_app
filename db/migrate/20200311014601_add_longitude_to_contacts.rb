class AddLongitudeToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :longitude, :integer
  end
end
