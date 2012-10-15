class Attempt < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  
  # Prevent creation of new records and modification to existing records
  def readonly?
    return !new_record?
  end
 
  # Prevent objects from being destroyed
  def before_destroy
    raise ActiveRecord::ReadOnlyRecord
  end
end
