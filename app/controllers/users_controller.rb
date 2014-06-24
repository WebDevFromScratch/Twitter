class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = User.find_by username: params[:username]
  end
end