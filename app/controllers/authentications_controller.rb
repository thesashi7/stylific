class AuthenticationsController < ApplicationController

#used to avoid conflicting emails from different providers  
@@unique_email_marker=0

#this action is a callback method meaning foreign providers callback
#is directed to this module
def create
  @omniauth = request.env["omniauth.auth"]
  
  authentication = Authentications.find_by_provider_and_uid(@omniauth['provider'], @omniauth['uid'])

  if(@@logingIn ==0) 
     registering(authentication)
  elsif(@@logingIn ==1)
    signingIn(authentication)
  end

end

private 

#authentication is an instance of Authentication
#registers the users with new authentication and provider
#if user is already registered using a specefic provider then redirects the user
# to the home page 
def registering(authentication)

   if (authentication.nil?)
     authentication = Authentications.new
     authentication.provider = @omniauth['provider']
     authentication.uid = @omniauth['uid']
     user = Customer.new
     #  authentication.user_id = user.id   Need to save the user first to generate the automated unique id
     if (@omniauth['info'])
        user.first_name = @omniauth['info']['first_name']
        user.last_name = @omniauth['info']['last_name']
        user.address = @omniauth['info']['location']
        user.description = @omniauth['info']['description']
        user.email = @omniauth['info']['email']         #auth.info.email
        user.password = Devise.friendly_token[0,20]
     end

     /=if (@omniauth['extra'])
      user.tempInfo = @omniauth['extra']['raw_info']
     end=/
    
     #need to check if preference exists
     preference = Preference.find_by_id(RegisterController.id)
     user.preference_id = preference.id
   
     if (!user.save)
        if(user.errors.added? :email, :taken)
          user.email = new_email_from_existing(user.email)
          user.save
        end
     end

     preference.customer_id = user.id
     preference.save

     authentication.user_id = user.id
     authentication.save  
     session[:user_id] = user.id
  
     flash[:notice] = "Thanks for registering\n"
     redirect_to root_path 
    else 
      redirect_to root_path, :notice => "You already have an account!\n Please logIn "
      
   end

end

#authentication is an instance of Authentication
#signs in the user if the user is registered with the specefic provider
#if the user is not registered with the provider then redirects to the home page with error message 
def signingIn (authentication)

  if authentication.instance_of?(Authentications)
     user = Customer.where(:id => authentication.user_id).first
     session[:user_id] = user.id
     @@logingIn=0
     redirect_to root_path, :notice => "Logged in successfully"
  else
     @@logingIn=0
     redirect_to root_path, :notice => "Sorry! You need to register first "

  end


end 

#oldEmail is the existing email or the email from which another email will be derived
#Creats a new email by using the old email
#returns the new email
#Example :-
#          oldEmail=another@email.com
#          new =new_email_from_existing(oldEmail) 
#          puts new 
#           Output ::  another0@email.com
def new_email_from_existing(oldEmail)
  newEmail=""

  oldEmail.split("").each do |a|
     if(a == '@')
        newEmail+= @@unique_email_marker.to_s
        @@unique_email_marker+=1
     end
     newEmail+=a
  end
  newEmail
end

end
