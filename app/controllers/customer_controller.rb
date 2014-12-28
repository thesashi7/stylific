class CustomerController < ApplicationController
    before_action :authenticate, only: [:news, :profile, :settings, :messages]
	
	def profile
		
	end
	
	def settings
		
	end

end
