class CreateUserAttributes < ActiveRecord::Migration
  def up
    migrate_to_hydra_entity :users
  end

  def down
    rollback_from_hydra_entity :users
  end
end
