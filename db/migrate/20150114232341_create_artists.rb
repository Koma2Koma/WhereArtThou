class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :twitter
      t.string :facebook
      t.string :instagram
      t.string :website
      t.array :tags
      t.text :about
      t.string :location

      t.timestamps
    end
  end
end
