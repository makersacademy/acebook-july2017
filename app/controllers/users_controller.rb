class UsersController < ApplicationController

  def show
    @users = User.all
    @user = User.find(params[:id])
  end

# trying to update user profile info and save it to DB = TO BE IMPLEMENTED

  # def edit
  #   @user = User.find(params[:id])
  #   @user.update_attributes(params[:user])
  #   @user.changed?
  #
  # end

end
