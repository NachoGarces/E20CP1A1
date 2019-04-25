class PagesController < ApplicationController
  before_action :authenticate_user!
	load_and_authorize_resource

  def dashboard
    @users = User.all
  end

  def update
    authorize! :dashboard, @users
    @user = User.find(params[:user_id])
    if @user.admin?
      @user.role = 1
    else
      @user.role = 0
    end
    @user.save
    redirect_to pages_dashboard_path
  end
end
