class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :state
      t.integer :member_id
      t.datetime :published_at

      t.timestamps
    end
  end
end
