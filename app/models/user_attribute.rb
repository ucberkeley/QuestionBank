class UserAttribute < ActiveRecord::Base
	has_many :user_values
end
