class AddBuResultToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :bu_result, :string
  end
end
