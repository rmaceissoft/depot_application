class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.string :title
      t.text :body

      t.timestamps
    end
    add_index :comments, :user_id
  end
end
