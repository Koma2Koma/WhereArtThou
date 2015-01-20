class AddArtistIdReferenceToWork < ActiveRecord::Migration
  def change
  	add_reference :works, :artist, index: true
  end
end
