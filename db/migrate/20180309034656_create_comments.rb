class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, index: true
      t.references :user, foreign_key: true
      t.text :body
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :comments, :deleted_at
  end
end
