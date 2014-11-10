class Customer < ActiveRecord::Base
	
	
        devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
# Setup accessible (or protected) attributes for your model
        
	has_one :preference

end
