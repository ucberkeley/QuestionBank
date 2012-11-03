class AddUserReferenceToQuestion < ActiveRecord::Migration
  def change
  	 change_table :questions do |t|
		t.belongs_to :user
	end
  end
end
