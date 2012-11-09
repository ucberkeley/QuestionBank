class CreateQuestionGroups < ActiveRecord::Migration
  def change
    create_table :question_groups do |t|
    	t.string :name, :null => true
    	t.references :user, :null => true
      	t.timestamps
    end
  end
end
