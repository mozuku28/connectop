class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @post = Post.new
    @user = current_user
    @follows = Follow.where(user_id: current_user.id)
    # @users = []
    # @follows.each do |f|
    #     @users << User.find(f.follow_user_id)
    # end
    @users = @follows.map do |f|
      User.find(f.follow_user_id)
    end
    # 上記インスタンス化はmapで書き換え可能。
  end

  def show
    @user = User.find(params[:id])
    @post = Post.where(user_id: @user.id).count
    @follow = Follow.where(user_id: @user.id).count
    @follower = Follower.where(follower_user_id: @user.id).count
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
    @user.soft_delete
    redirect_to users_path
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