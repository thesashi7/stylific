class SessionsController < ApplicationController

   def create
      user = Customer.where(:email => params[:email]).first

      if(user && user.valid_password?(params[:password]))
         session[:user_id] = user.id
         redirect_to root_path, :notice => "Logged in successfully"
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
