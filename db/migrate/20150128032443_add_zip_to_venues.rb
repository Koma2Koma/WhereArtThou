class AddZipToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :zip, :string
  end
end
