class PostsController < ApplicationController

    def index
        @user = User.find(params[:user_id])
        @post = Post.new
    end

    def show
    end

    def create
        # render plain: params[:post].inspect
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.save
        redirect_to user_posts_path(current_user.id)
    end

    def destroy
    end

    private
        def post_params
            params.require(:post).permit(:title, :body, :user, :image)
        end

end



# クリエイトをするさい、パラムスの値を渡すタイミングはニューをしたタイミング