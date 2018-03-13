class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.text :content
      t.attachment :image
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :posts, :deleted_at
  end
end
