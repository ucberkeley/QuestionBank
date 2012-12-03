class User < ActiveRecord::Base
  rolify
  include HydraAttribute::ActiveRecord
  attr_accessible :role_ids, :provider, :uid, :name, :email
  has_many :questions
  has_many :attempts
  has_and_belongs_to_many :user_groups


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

  def self.by_role(role, resource = nil)
    users = joins(:roles).where({:roles => { :name => role }})
    if resource
      if resource.is_a? Class
        users = users.where({ :roles => { :resource_type => resource.name, :resource_id => nil }})
      else
        users = users.where({ :roles => { :resource_type => resource.class.name, :resource_id => resource.id }})
      end
    end
  end

end
