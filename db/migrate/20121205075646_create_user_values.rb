class CreateUserValues < ActiveRecord::Migration
  def change
    create_table :user_values do |t|
      t.string :string_value
      t.float :float_value
      t.text :text_value
      t.integer :integer_value
      t.boolean :bool_value
      t.datetime :date_value
      t.references :user, :null => false
      t.references :user_attribute, :null => false

      t.timestamps
    end
  end
end
