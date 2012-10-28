class AddQuestionsTagsTable < ActiveRecord::Migration
	def up
		create_table :questions_tags, :id => false do |t|
			t.references :question
			t.references :tag
		end
	end

	def down
		drop_table :questions_tags
	end
end
