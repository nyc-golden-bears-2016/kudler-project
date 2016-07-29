class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, { limit: 64, null: false, index: true }
      t.string :password_digest, null: false
      t.string :lifestyle_type, default: "blank"


      t.timestamps
    end
  end
end
