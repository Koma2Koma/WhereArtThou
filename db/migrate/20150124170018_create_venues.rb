class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :phone
      t.text :description
      t.string :twitter
      t.string :facebook
      t.string :instagram
      t.string :website
      t.string :email

      t.timestamps
    end
  end
end
