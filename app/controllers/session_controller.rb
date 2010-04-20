class SessionController < ApplicationController
 
  def login
    user=User.find_by_login_and_password(params[:login], params[:password])
    if user
      session[:user_id]= user.id
      redirect_to :action => "index"
    else
      reset_session
      flash[:note] = "Login name/password is incorrect! Please try again or create a new user."
    end
  end

end
