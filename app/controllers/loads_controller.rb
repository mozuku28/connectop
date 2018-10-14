class LoadsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def show
  end
 
  # def new
  #   @load = Load.new
  #   @type = Menu.find(params[:menu_id])
  #   @menu = Menu.new
  # end

  def new
    @load = Load.new
    training = Training.find(params[:training_id])
    @type = Menu.find(training.menu_id)
  end

  def create
    @load = Load.new(load_params)
    
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
            :load,
            :times,
            :time,
            :distance
					)
    end

end
