class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :state
      t.datetime :edited_at
      t.datetime :published_at
      t.integer :member_id

      t.timestamps
    end
  end
end
