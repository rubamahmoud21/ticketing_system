class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.errors.present?
      respond_to do |format|
        format.js
      end
    else 
      session[:user_id] = @user.id
      redirect_to projects_path  
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :name)
    end

end
