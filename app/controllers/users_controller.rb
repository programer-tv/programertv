class UsersController < ApplicationController
  def index
    @users = User.all
    authorize @users
  end

  def show
    @user = User.friendly.find(params[:id])
    authorize @user
  end
end
