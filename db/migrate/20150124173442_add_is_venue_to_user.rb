class AddIsVenueToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_venue, :boolean, default: false
  end
end
