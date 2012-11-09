class ConnectUserAndUserGroups < ActiveRecord::Migration
  def change
  	create_table :users_user_groups, :id => false do |t|
		t.references :user_group, :null => false
		t.references :user, :null => false
	end
  end
end
