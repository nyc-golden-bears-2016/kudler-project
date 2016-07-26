class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string  :name, { limit: 90, null: false, index: true }


      t.timestamps
    end
  end
end
