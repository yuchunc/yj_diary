class AddFacebookInfoToMembers < ActiveRecord::Migration
  def change
    add_column :members, :facebook_id, :integer
    add_column :members, :facebook_username, :string
    add_column :members, :facebook_email, :string
  end
end
