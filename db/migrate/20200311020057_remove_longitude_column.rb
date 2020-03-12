class RemoveLongitudeColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :longitude, :integer
  end
end
