class CreateQuestionValues < ActiveRecord::Migration
  def change
    create_table :question_values do |t|
      t.string :string_value
      t.float :float_value
      t.text :text_value
      t.integer :integer_value
      t.boolean :bool_value
      t.datetime :date_value
      t.references :question, :null => false
      t.references :question_attributes, :null => false

      t.timestamps
    end
  end
end
