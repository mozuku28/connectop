class Admins::UsersController < ApplicationController
    before_action :authenticate_admin!
    layout 'admins'
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @post = Post.where(user_id: @user.id).count
    end

    def destroy
        @user = User.find(params[:id])
        @user.soft_delete
        redirect_to admins_users_path
    end
    
end