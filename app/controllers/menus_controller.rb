class MenusController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @menu = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    # render plain: params[:menu].inspect
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id
    @menu.save
    training = Training.new
    training.menu_id = @menu.id
    training.user_id = current_user.id
    training.save
    redirect_to menus_path
  end


  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to menus_path
  end

  def destroy
	  @menu = Menu.find(params[:id])
	  @menu.destroy
	  redirect_to menus_path
	end

  private

    def menu_params
      params.require(:menu).permit(:name, :part_id, :type_id, :user_id)
    end

    def training_params
      params.require(:training).permit(:menu_id, :user_id)
    end

end