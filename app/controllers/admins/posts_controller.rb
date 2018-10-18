class Admins::PostsController < ApplicationController
    before_action :authenticate_admin!
    layout 'admins'

    def index
        @users = User.all
    end

    def show
        @post = Post.find(params[:id])
        @user = User.find(params[:user_id])
        @trainings_id = Training.where(post_id: @post.id)
        @trainings = @trainings_id.map do |f|
            Menu.find(f.menu_id)
        end
        @trainings = Training.where(post_id: @post.id)
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to admins_path
    end

end