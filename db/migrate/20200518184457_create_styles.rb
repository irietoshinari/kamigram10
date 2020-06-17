class CreateStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :styles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :image_id, null: false
      t.integer :user_id, null: false
      t.integer :likes_count

      t.timestamps
    end
  end
end
