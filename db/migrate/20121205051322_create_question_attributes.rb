class CreateQuestionAttributes < ActiveRecord::Migration
  def change
    create_table :question_attributes do |t|
      t.string :name
      t.string :backend_type

      t.timestamps
    end
  end
end
