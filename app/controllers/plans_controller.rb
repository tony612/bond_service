class PlansController < ApplicationController
  respond_to :html, :json
  layout false

  def index
    @plans = Plan.all
  end

  def new
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      respond_with { |format| format.json {render json: @plan} }
    else
      render json: {msg: "Saved error!"}
    end
  end

  def edit
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(plan_params)
      respond_to do |format|
        format.html { redirect_to plans_path }
        format.json { render :nothing => true, :status => :ok }
      end
    else
      respond_to do |format|
        format.html { redirect_to plans_path }
        format.json { render :nothing => true, :status => :bad_request }
      end
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    respond_to do |format|
      format.json { render :nothing => true, :status => :ok }
    end
  end

private
  def plan_params
    params.required(:plan).permit(:name, :category, :desc, :content)
  end
end
