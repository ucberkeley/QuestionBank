class AddIsCorrectAndCohortIdToAttempts < ActiveRecord::Migration
  def change
  	add_column :attempts, :is_correct, :boolean
  	add_column :attempts, :cohort_id, :integer
  end
end
