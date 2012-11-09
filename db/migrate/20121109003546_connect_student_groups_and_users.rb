class ConnectStudentGroupsAndUsers < ActiveRecord::Migration
  def change
  	create_table :student_groups_users, :id => false do |t|
		t.references :student_group, :null => false
		t.references :user, :null => false
	end
  end
end
