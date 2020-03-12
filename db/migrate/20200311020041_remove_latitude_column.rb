class RemoveLatitudeColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :latitude, :integer
  end
end
