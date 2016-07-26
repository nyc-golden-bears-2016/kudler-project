class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string  :name, { limit: 90, null: false, index: true }
      t.integer :artist_id, foreign_key: true


      t.timestamps
    end

  end
end
