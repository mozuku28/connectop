class FollowsController < ApplicationController

    def index
        @user = User.find(params[:user_id])
        @follows = Follow.where(user_id: @user.id)
        # @users = [] コントローラーで表紙させるヒント（野原さん情報）
        @users = []
        @follows.each do |f|
            @users << User.find(f.follow_user_id)
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
