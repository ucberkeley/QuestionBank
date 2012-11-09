class ConnectQuestionsAndQuestionGroups < ActiveRecord::Migration
  def change
  	create_table :questions_question_groups, :id => false do |t|
		t.references :question_group, :null => false
		t.references :question, :null => false
	end
  end
end
