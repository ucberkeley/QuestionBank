class CreateQuestionSets < ActiveRecord::Migration
  def change
    create_table :question_sets do |t|
    	t.references :user, :null => true
    	t.timestamps
    end
  end
end
