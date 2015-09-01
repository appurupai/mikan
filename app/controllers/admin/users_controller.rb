class Admin::UsersController < ApplicationController

  def index
    @users = User.all.order("CREATED_AT DESC") # select all the users, from the first added one to the last added one
  end

  def new
    @user = User.new # create a new user ...
  end

  def create # ... and save it
    tmp = User.new(user_params)
    if tmp.save # if the user is saved
      redirect_to admin_users_path
    else
      redirect_to :back
    end
  end
  
  def destroy
    User.destroy params[:id]  # select an user with a given ID
    redirect_to admin_users_path
  end

  # the following is only available and can only be accessible from this controller (you can't call it from the outside)
  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
