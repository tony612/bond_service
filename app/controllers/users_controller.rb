class UsersController < ApplicationController
  respond_to :html, :json
  def index
    @users = User.all
    respond_with do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    respond_with do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def new
  end
end
