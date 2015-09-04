class Admin::UsersController < ApplicationController
  before_filter :is_admin?
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

  def edit
    @user = User.find params[:id]
  end

  def update
    tmp = User.find params[:id] # select a season with a given ID
    if tmp.update_attributes(:admin => params[:user][:admin])  # if it's saved
      redirect_to admin_users_path
    else
      redirect_to :back
    end
  end

  def destroy
    User.destroy params[:id]  # select an user with a given ID and destroy it
    redirect_to admin_users_path
  end

  # the following is only available and can only be accessible from this controller (you can't call it from the outside)
  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
end
