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
    current_user.job_hours = 0
    current_user.save
    flash[:note]="Congratulations! You have retired and won the game."
    redirect_to :action => :profile
  end

  def new
    @user = User.new
    render :layout => "login_layout"
  end

  def create
    @user = User.new(params[:user].merge({:cash => 500}))
    @user.job_hours = @user.hours_worked
    if @user.save
      session[:user_id] = @user.id
      flash[:note] = "New user account successfully created"
      redirect_to rules_pages_path      
    else
      flash[:note]="Sorry! Something is wrong with the credentials you entered."
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
