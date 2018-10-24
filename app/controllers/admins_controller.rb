class AdminsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins'
  
  def index
    @users = User.all
  end
  
end
