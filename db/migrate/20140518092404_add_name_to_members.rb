class AddNameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :name, :string, default: ""
  end
end
