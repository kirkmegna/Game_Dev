class UsersController < ApplicationController
 
  include SessionHelper
 
  skip_before_filter :check_if_we_need_a_login, :only => [:new, :create]
  
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def new
    @user = User.new
    render :layout => "login_layout"
  end

  def create
    @user = User.new(params[:user].merge({:job_hours => 5, :cash => 500}))
    if @user.save
      session[:user_id] = @user.id
      redirect_to :action => :show      
    else
      #TODO: maybe set a flash variable?
      render :action => :new, :layout => "login_layout"
    end

  end

  def delete
end

  def profile
    @user = current_user
    render :action => :show
  end

end
