class PartsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @parts = Part.all
  end
end
