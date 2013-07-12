class PlansController < ApplicationController
  respond_to :html, :json
  layout false, :except => ["upload"]

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
      @plan.create_retionship_with_customer(customer_category_id_params[:customer_category_ids]) if customer_category_id_params[:customer_category_ids]
      respond_with { |format| format.json {render json: @plan} }
    else
      render json: {error_msg: @plan.errors.messages}
    end
  end

  def edit
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(plan_params)
      @plan.plan_settings.delete_all
      @plan.create_retionship_with_customer(customer_category_id_params[:customer_category_ids])
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

  def publish
    @plan = Plan.find(params[:id])
    msg = PlanMailer.publish(@plan)

    @plan.customers.each do |customer|
      mail = msg.dup
      mail.to = customer.email
      mail.deliver
    end

    respond_to do |format|
      format.json { render :nothing => true, :status => :ok }
    end
  end

  def upload
  end

  def import
    #begin
      Plan.import params[:plan][:file]
    #rescue
    #  return redirect_to upload_plans_path, :flash => {error_msg: "Wrong file"}
    #end
    redirect_to root_path(:anchor => "plans")
  end

private
  def plan_params
    params.required(:plan).permit(:name, :category, :desc, :content)
  end
  def customer_category_id_params
    params.required(:plan).permit(:customer_category_ids => [])
  end
end
