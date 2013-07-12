class UsersController < ApplicationController
  respond_to :html, :json
  layout false, :except => ["upload"]

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

  def modify
  end

  def create
    @user = User.new(user_params)
    if @user.save
      respond_with { |format| format.json {render json: @user} }
    else
      render json: {error_msg: @user.errors.messages}
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      respond_to do |format|
        format.html { redirect_to users_path }
        format.json { render :nothing => true, :status => :ok }
      end
    else
      render json: {error_msg: @user.errors.messages}
    end
  end

  def destroy
    @user = User.find(params[:id])
    unless @user == current_user
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_path }
        format.json { render :nothing => true, :status => :ok }
      end
    else
      respond_to do |format|
        format.html { redirect_to users_path }
        format.json { render :nothing => true, :status => :bad_request }
      end
    end
  end

  def upload
  end

  def import
    User.import params[:user][:file]
    redirect_to root_path(:anchor => "users")
  end
private
  def user_params
    params.required(:user).permit(:email, :password, :number, :name, :desc)
  end
end
