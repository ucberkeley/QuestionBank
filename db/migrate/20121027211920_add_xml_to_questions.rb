class AddXmlToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :xml, :text
  end
end
