class AuthenticationsController < ApplicationController


def create
  omniauth = request.env["omniauth.auth"]
  
  authentication = Authentications.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])

  #for registration
  if (authentication.nil? && @@logingIn == 0)
     authentication = Authentications.new
     authentication.provider = omniauth['provider']
     authentication.uid = omniauth['uid']
     user = Customer.new
     #  authentication.user_id = user.id   Need to save the user first to generate the automated unique id
     if (omniauth['info'])
        user.name = omniauth['info']['name']
        user.email = omniauth['info']['email']         #auth.info.email
        user.password = Devise.friendly_token[0,20]
     end
     user.save
     authentication.user_id = user.id
     authentication.save  
     session[:user_id] = user.id
	
     flash[:notice] = "Thanks for registering\n"
     redirect_to root_path 
  #for logging in with registered provider
  elsif authentication.instance_of?(Authentications)
     
     if (@@logingIn==1)
     user = Customer.where(:id => authentication.user_id).first
     session[:user_id] = user.id
     @@logingIn=0
     redirect_to root_path, :notice => "Logged in successfully"
     else
     
     redirect_to root_path, :notice => "You already have an account!\n Please logIn "
     end
   #
  else
   redirect_to root_path, :notice => "Sorry! You need to register first with your #{omniauth['provider']} oor add that to your account"

  end

end

end
