class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :question_id
      t.integer :user_id
      t.string :answer
      t.datetime :created_at
    end
  end
end
