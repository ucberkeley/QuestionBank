class ConnectUserGroupsAndUsers < ActiveRecord::Migration
  def change
  	create_table :user_groups_users, :id => false do |t|
		t.references :user_group, :null => false
		t.references :user, :null => false
	end
  end
end
