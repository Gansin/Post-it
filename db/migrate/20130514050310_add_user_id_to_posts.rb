class AddUserIdToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :user_id, :integer
  	# format => add_column :affected table, :name of field, :type
  end
end
