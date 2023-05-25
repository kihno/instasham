class FollowsController < ApplicationController
  def followers
    @user = User.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
  end
end
