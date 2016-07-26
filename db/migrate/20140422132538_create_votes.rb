class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, :default => 0
      t.integer :voteable_id
      t.string  :voteable_type
      t.integer :user_id, foreign_key: true


      t.timestamps
    end
    add_index :votes, [:voteable_type,:voteable_id ]
  end
end
