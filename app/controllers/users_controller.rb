class UsersController < ApplicationController
  def index
    @user = current_user
    @follows = Follow.where(user_id: @user.id)
    @post = Post.new
    @posts = []
    @follows.each do |f|
        @posts << Post.find(f.user_id)
    end
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