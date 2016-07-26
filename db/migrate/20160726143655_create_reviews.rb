class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, { limit: 90, null: false, index: true }
      t.string :body, null: false
      t.integer :reviewer_id, foreign_key: true, null: false
      t.integer :reviewable_id
      t.string  :reviewable_type


      t.timestamps
    end
    add_index :reviews, [:reviewable_type, :reviewable_id ]
  end
end
