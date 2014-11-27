class CustomerController < ApplicationController
    before_action :authenticate, only: [:news, :profile, :settings, :messages]
	
	def news
		
	end
	
	def profile
		
	end
	
	def settings
		
	end
	
	def messages
		
	end

end
