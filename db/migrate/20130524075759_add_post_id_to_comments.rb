class AddPostIdToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :post_id, :integer
  	# format => add_column :affected table, :name of field, :type
  end
end
