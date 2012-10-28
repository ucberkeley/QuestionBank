class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :xml
      t.datetime :created_at

      t.timestamps
    end
  end
end
