# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :check_if_we_need_a_login
  layout "layout"

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def check_if_we_need_a_login
    if session[:user_id] == nil
      redirect_to login_path
      return
    end
  end
end
