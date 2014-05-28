class UsersController < ApplicationController
  def index
    @users = User.all

    if params && params[:user_name].present?
      @users = User.where "email LIKE ?", "%#{params[:user_name]}%"
    end
  end
end
