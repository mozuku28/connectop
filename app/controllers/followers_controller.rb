class FollowersController < ApplicationController

    def index
        @user = User.find(params[:user_id])
        @followers = Follower.where(follower_user_id: @user.id)
        # @users = [] コントローラーで表紙させるヒント（野原さん情報）
        @users = []
        @followers.each do |f|
            @users << User.find(f.user_id)
        end
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
    end

    def update
    end

    def destroy
    end
 
    private


end
