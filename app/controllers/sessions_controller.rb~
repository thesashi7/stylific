class SessionsController < ApplicationController
#to indicate if user is trying to login and not register
#this class variable is mainly to distinguish if the user is loging in or registering during authentication of foreign providers  

	
  def new
  	@@logingIn=1
  end

   def create
      user = Customer.where(:email => params[:email]).first
      @@logingIn=0
      if(user && user.valid_password?(params[:password]))
         session[:user_id] = user.id
         redirect_to news_path, :notice => "Logged in successfully"
      else
         flash.now[:alert] = "Invalid login/password combination"
         render :action => 'new'
     end
   end

   def destroy
      reset_session
      redirect_to root_path, :notice => "You successfully logged out"
   end

end
