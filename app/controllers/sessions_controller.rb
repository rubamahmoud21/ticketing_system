class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :home]

  
  def home
    redirect_to projects_path if logged_in? 
  end

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
       redirect_to projects_path
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def login
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
