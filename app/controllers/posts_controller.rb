class PostsController < ApplicationController

    def index
        @posts = Post.all
        @post = Post.new
    end

    def show
        
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.save
        redirect_to root_path
    end

    private
        def post_params
            params.require(:post).permit(:title, :body, :user, :image)
        end

end



# クリエイトをするさい、パラムスの値を渡すタイミングはニューをしたタイミング