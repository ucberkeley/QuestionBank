class ConnectQuestionsAndTags < ActiveRecord::Migration
  def change
  	create_table :questions_tags, :id => false do |t|
		t.references :question, :null => false
		t.references :tag, :null => false
	end
  end
end
