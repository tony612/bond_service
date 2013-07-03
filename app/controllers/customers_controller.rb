class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  layout false, :except => ["upload"]

  def index
    @customers = Customer.includes(:customer_category)
  end

  def show
    respond_with do |format|
      format.json { render json: @customer }
    end
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.json { render json: @customer }
      else
        format.json { render msg: "Saved error!"}
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { render :nothing => true, :status => :ok }
    end
  end

  def upload
  end

  def import
    Customer.import params[:customer][:file]
    redirect_to root_path(:anchor => "customers")
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :fund_account, :gender, :id_no, :address, :phone, :birthday)
    end
end
