class AddPictureToOrbs < ActiveRecord::Migration
  def change
    add_column :orbs, :picture, :string
  end
end
