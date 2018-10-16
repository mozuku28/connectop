class LoadsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @load = Load.all
    
  end

  # def index
  #   @post = Post.new
  #   @user = current_user
  #   @follows = Follow.where(user_id: current_user.id)
  #   @users = []
  #   @follows.each do |f|
  #       @users << User.find(f.follow_user_id)
  #   end
  # end


  def show
  end

  def new
    @load = Load.new
    @menu = Menu.find(params[:menu_id])
  end

  def create
    @load = Load.new(load_params)
    @load.user_id = current_user.id
    menu = Menu.find(params[:menu_id])
    @load.menu_id = menu.id
    @load.save
    redirect_to menu_loads_path(menu)
  end





  def edit
  end

  def update
  end

  def destroy
  end

  private

    def load_params
      params.require(:load)
					.permit(
            :menu_id,
            :user_id,
            :load,
            :times,
            :time,
            :distance
					)
    end

end
