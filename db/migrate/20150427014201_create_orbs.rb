class CreateOrbs < ActiveRecord::Migration
  def change
    create_table :orbs do |t|
      t.string :category
      t.string :name
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :orbs, [:user_id, :created_at]
  end
end
