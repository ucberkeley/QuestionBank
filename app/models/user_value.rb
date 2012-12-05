class UserValue < ActiveRecord::Base

	belongs_to :user_attributes
	belongs_to :users

	def self.update_attribute (user, attribute, value)
		newAttribute = self.create(:user_attribute_id => attribute.id, :user_id=>user.id, (attribute.backend_type+"_value").to_sym => value)
	end
end
