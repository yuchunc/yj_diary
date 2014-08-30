class AddPuResultToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :pu_result, :string
  end
end
