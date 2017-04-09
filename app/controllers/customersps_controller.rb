require 'sp_logger'
class CustomerspsController < ApplicationController
  before_action :set_customersp, only: [:show, :edit, :update, :destroy]

  # GET /customersps
  # GET /customersps.json
  def index
    @customersps = Customersp.all
  end

  # GET /customersps/1
  # GET /customersps/1.json
  def show
  end



  # GET /customersps/new
  def new
    @customersp = Customersp.new
  end

  # GET /customersps/1/edit
  def edit
  end

  # POST /customersps
  # POST /customersps.json
  def create
    @customersp = Customersp.new(customersp_params)

    # retrieve the instance/object of the MyLogger class
logger = SpLogger.instance
logger.logInformation("A new Customer requested: " + @customersp.namesp + @customersp.surnamesp + @customersp.emailsp + @customersp.phonesp)

    respond_to do |format|
      if @customersp.save
        format.html { redirect_to @customersp, notice: 'Customersp was successfully created.' }
        format.json { render :show, status: :created, location: @customersp }
      else
        format.html { render :new }
        format.json { render json: @customersp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customersps/1
  # PATCH/PUT /customersps/1.json
  def update
    respond_to do |format|
      if @customersp.update(customersp_params)
        format.html { redirect_to @customersp, notice: 'Customersp was successfully updated.' }
        format.json { render :show, status: :ok, location: @customersp }
      else
        format.html { render :edit }
        format.json { render json: @customersp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customersps/1
  # DELETE /customersps/1.json
  def destroy
    @customersp.destroy
    respond_to do |format|
      format.html { redirect_to customersps_url, notice: 'Customersp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customersp
      @customersp = Customersp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customersp_params
      params.require(:customersp).permit(:namesp, :surnamesp, :emailsp, :phonesp)
    end
end
