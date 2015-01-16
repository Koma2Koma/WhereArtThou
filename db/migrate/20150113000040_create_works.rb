class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
    	t.text :title
    	t.text :year
    	t.decimal :price, precision: 10, scale: 2
    	t.text :description
    	t.text :medium
    	t.text :style
      t.references :artist

      t.timestamps
    end
  end
end
