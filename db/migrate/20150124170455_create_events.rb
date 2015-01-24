class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :start_date
      t.string :end_date
      t.string :time
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.text :description
      t.string :contact
      t.string :facebook

      t.timestamps
    end
  end
end
