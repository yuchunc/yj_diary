class ReorganizePostForPrivateContent < ActiveRecord::Migration
  def change
    rename_column :posts, :content, :public_content
    add_column :posts, :private_content, :text
  end
end
