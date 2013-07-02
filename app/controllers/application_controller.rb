class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :set_sidebar_data

protected
  def set_sidebar_data
    @user_count = User.count
    @plan_count = Plan.count
    @customer_count = Customer.count
  end
end
