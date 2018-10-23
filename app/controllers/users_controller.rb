class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @post = Post.where(user_id: current_user.id)
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @post = Post.where(user_id: @user.id).count
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end


  private
    def user_params
      params.
      require(
        :user
        ).permit(
          :name,
          :image,
          :introduction,
          :gender,
          :height,
          :weight
          )
    end
end