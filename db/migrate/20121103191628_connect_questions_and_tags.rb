class ConnectQuestionsAndTags < ActiveRecord::Migration
  def change
  	create_table :questions_tags, :id => false do |t|
		t.references :question
		t.references :tag
	end
  end
end
