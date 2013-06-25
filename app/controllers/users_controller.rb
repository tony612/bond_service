class UsersController < ApplicationController
  respond_to :html, :json
  layout false

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

  def create
    @user = User.new(user_params)
    if @user.save
      respond_with { |format| format.json {render json: @user} }
    else
      render json: {msg: "Saved error!"}
    end
  end
private
  def user_params
    params.required(:user).permit(:email, :password)
  end
end
