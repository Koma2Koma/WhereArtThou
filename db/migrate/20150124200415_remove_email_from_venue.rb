class RemoveEmailFromVenue < ActiveRecord::Migration
  def change
  	remove_column :venues, :email
  end
end
