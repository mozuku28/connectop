class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = User.find(params[:user_id])
        @users = []
        @user.followings.each do |f|
            @users << User.find(f.id)
        end
        @users << User.find(@user.id)
    end

    def show
    end

    def new
        @post = Post.new
        @training = @post.trainings.build
        @load = @training.loads.build
        @user = User.find(params[:user_id])
    end

    def create
        # render plain: params[:post].inspect
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to user_posts_path(current_user.id)
        else
            @training = @post.trainings.build
            @load = @training.loads.build
            @user = User.find(params[:user_id])
            render 'new'
        end
    end

    def edit
        @post = Post.find(params[:id])
        @user = User.find(params[:user_id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to user_posts_path(current_user.id)
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to user_posts_path(current_user.id)
    end

    private
        def post_params
            params.require(:post).permit(
                                    :memo,
                                    :user,
                                    :image,
                                    trainings_attributes:[
                                        :id,
                                        :menu_id,
                                        :_destroy,
                                        loads_attributes:[
                                            :id,
                                            :load,
                                            :_destroy
                                            ]])
        end

end



# クリエイトをするさい、パラムスの値を渡すタイミングはニューをしたタイミング