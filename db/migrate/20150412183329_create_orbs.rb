class CreateOrbs < ActiveRecord::Migration
  def change
    create_table :orbs do |t|
      t.string :category
      t.string :name
      t.string :description
      t.string :image

      t.timestamps null: false
    end
  end
end
