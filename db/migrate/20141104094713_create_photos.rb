class CreatePhotos < ActiveRecord::Migration
  def change
  	 create_table :photos do |t|
  		t.string :filename
  		t.integer :album_id
  		t.string :caption

  		t.timestamps
  	end
  end
end
