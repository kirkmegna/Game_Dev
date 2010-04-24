class SessionController < ApplicationController
  layout nil 
  skip_before_filter :check_if_we_need_a_login, :only => :login
 
  def login
    user=User.find_by_login_and_password(params[:login], params[:password])
    if user
      session[:user_id]= user.id
      flash[:note] = "Welcome " + user.name + ". You have logged in successfully!" 
      redirect_to profile_users_path
    end
     #flash[:note] = "Password/Login combination is invalid." 
     
  end

end
