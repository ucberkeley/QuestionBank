class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.text :answer
      t.boolean :is_correct
      t.datetime :created_at
      t.references :question
      t.references :user

      t.timestamps
    end
    add_index :attempts, :question_id
    add_index :attempts, :user_id
  end
end
