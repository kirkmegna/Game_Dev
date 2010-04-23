class UsersController < ApplicationController
 
  include SessionHelper
  
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
    user = User.create(:login => "#", :password => "#", :name => "#", :job => "#", :job_hours => "123...", :cash => 500)
    session[:user_id] = user.id
    redirect_to :action => "new"
  end

  def delete
  end

end
