class CreateQuestionAttributes < ActiveRecord::Migration
  def up
  	migrate_to_hydra_entity :questions
  end

  def down
  	rollback_from_hydra_entity :questions
  end
end
