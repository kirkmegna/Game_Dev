class SessionController < ApplicationController
  layout nil 
  skip_before_filter :check_if_we_need_a_login, :only => :login
 
  def login
    user=User.find_by_login_and_password(params[:login], params[:password])
    if user
      session[:user_id]= user.id
      flash[:note] = "You are real!!!"
      redirect_to user_path(user)
    else
      flash[:note] = "Login name/password is incorrect! Please try again or create a new user."
    end
  end

end
