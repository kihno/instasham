class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    current_user.following << @user

    redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(following_id: @user.id).destroy

    redirect_back(fallback_location: user_path(@user))
  end

  def search
    if params[:search].blank?
      @results = User.all
    else
      @parameter = params[:search].downcase
      @results = User.all.where("lower(username) LIKE :search", search: "%#{@parameter}%")
    end
  end
end
