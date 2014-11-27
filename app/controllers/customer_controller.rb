class CustomerController < ApplicationController
    before_action :authenticate, [:news, :profile, :settings, :messages]
	
	def news
		
	end
	
	def profile
		
	end
	
	def settings
		
	end
	
	def messages
		
	end

end
