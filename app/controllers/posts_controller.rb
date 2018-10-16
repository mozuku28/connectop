class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = User.find(params[:user_id])
        @post = Post.new
    end

    def show
    end

    def new
        @post = Post.new
        @training = @post.trainings.build
        @menu = @training.menus.build
    end

    def create
        # render plain: params[:post].inspect
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.save
        redirect_to user_posts_path(current_user.id)
    end

    def edit
        @post = Post.find(params[:id])
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
                                        :name,
                                        _destroy,
                                        menus_attributes:[
                                            :id,
                                            :description,
                                            :_destroy
                                            ]])
        end

end



# クリエイトをするさい、パラムスの値を渡すタイミングはニューをしたタイミング