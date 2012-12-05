class UserGroup < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :attempts, :through => :users
  after_save :save_roles

  def owner_user_ids
    if @owner_user_ids
      @owner_user_ids
    else
      users = User.by_role(:owner, self).map(&:id) 
    end
  end

  def owners
    users = User.by_role(:owner, self)
  end

  def viewers
    users = User.by_role(:viewer, self)
  end

  def owner_user_ids=(user_ids)
    @owner_user_ids = user_ids
  end


  def viewer_user_ids
    if @viewer_user_ids
      @viewer_user_ids
    else
      users = User.by_role(:viewer, self).map(&:id) 
    end
  end

  def viewer_user_ids=(user_ids)
    @viewer_user_ids = user_ids
  end

  resourcify

private
  # https://github.com/EppO/rolify/issues/63
  def save_roles
    # Save owners
    @owner_user_ids = @owner_user_ids.reject(&:empty?) if !@owner_user_ids.nil?
    users = User.by_role(:owner, self).where("users.id not IN (?)", @owner_user_ids)
    users.each do |user|
      user.remove_role :owner, self
    end
    users = User.where("users.id IN (?)", @owner_user_ids)
    users.each do |user|
      user.add_role :owner, self
    end


    # Save viewers
    @viewer_user_ids = @viewer_user_ids.reject(&:empty?) if !@viewer_user_ids.nil?
    users = User.by_role(:viewer, self).where("users.id not IN (?)", @viewer_user_ids)
    users.each do |user|
      user.remove_role :viewer, self
    end
    users = User.where("users.id IN (?)", @viewer_user_ids)
    users.each do |user|
      user.add_role :viewer, self
    end

end
end
