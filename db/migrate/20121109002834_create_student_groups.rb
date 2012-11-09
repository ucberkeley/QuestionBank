class CreateStudentGroups < ActiveRecord::Migration
  def change
    create_table :student_groups do |t|
    	t.timestamps
    end
  end
end
