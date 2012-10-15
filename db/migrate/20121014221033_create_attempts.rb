class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.belongs_to :question
      t.belongs_to :user
      t.string :answer
      t.datetime :created_at
    end
  end
end
