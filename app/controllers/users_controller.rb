class UsersController < ApplicationController

  def show
    @users = User.all
    p "is this working?"
    p @users
    @user = User.find(params[:id])
  end


end
