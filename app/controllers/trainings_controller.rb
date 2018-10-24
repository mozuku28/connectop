class TrainingsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @trainings = Training.all

    @menus = []
      @trainings.each do |f|
        @menus << Menu.find(f.menu_id)
      end

    menus = Menu.all
  end





  def new
    @training = Training.new
  end

  def create
    # render plain: params[:training].inspect
    @training = Training.new(post_params)
    @training.user_id = current_user.id
    @training.save
  end

  private
    def training_params
      params.require(:training).permit(:name, :part_id, :type)
    end
end
