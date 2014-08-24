class AddFacebookInfoToMembers < ActiveRecord::Migration
  def change
    add_column :members, :provider, :string
    add_column :members, :username, :string
    add_column :members, :uid, :integer
    add_column :members, :oauth_hash, :text
    add_column :members, :oauth_access_token, :string
    add_column :members, :oauth_expires_at, :datetime
  end
end
