class ConnectQuestionGroupsAndQuestions < ActiveRecord::Migration
 def change
  	create_table :question_groups_questions, :id => false do |t|
		t.references :question_group, :null => false
		t.references :question, :null => false
	end
  end
end
