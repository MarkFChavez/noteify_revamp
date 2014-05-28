class RelationshipsController < ApplicationController
  def create
    user = User.find params[:user]
    follow_user user

    redirect_to users_path, notice: "You are now following #{user.email}"
  end

  private

  def follow_user user
    current_user.follow! user if current_user != user
  end
end
