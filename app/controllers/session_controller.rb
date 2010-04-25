class SessionController < ApplicationController
  layout "login_layout" 
  skip_before_filter :check_if_we_need_a_login, :only => :login
 
 
 def login
   
    return unless params[:login].present? and params[:password].present?

    user=User.find_by_login_and_password(params[:login], params[:password])
    if user 
      session[:user_id]= user.id
      flash[:note] = "Welcome " + user.name + ". You have logged in successfully!" 
      redirect_to profile_users_path
    else
    flash[:note] = "Password/Login combination is invalid." 
    end 
   

   
   
 end
  
end
