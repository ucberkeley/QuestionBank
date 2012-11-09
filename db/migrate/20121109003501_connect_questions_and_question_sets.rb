class ConnectQuestionsAndQuestionSets < ActiveRecord::Migration
  def change
  	create_table :questions_question_sets, :id => false do |t|
		t.references :question_set, :null => false
		t.references :question, :null => false
	end
  end
end
