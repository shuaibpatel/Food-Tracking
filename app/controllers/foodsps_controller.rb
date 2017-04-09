
require 'sp_logger'
class FoodspsController < ApplicationController
  before_action :set_foodsp, only: [:show, :edit, :update, :destroy]

  # GET /foodsps
  # GET /foodsps.json
  def index
# For URL like /customersps/1/foodsps
# Get the customersp with id=1
@customersp = Customersp.find(params[:customersp_id])
# Access all foodsp for that customersp
@foodsps = @customersp.foodsps
  end



  # GET /customersps/1/foodsps/2
  def show
    @customersp = Customersp.find(params[:customersp_id])
# For URL like /customersps/1/foodsps/2
# Find an foodsp in customersps 1 that has id=2
@foodsp = @customersp.foodsps.find(params[:id])
  end

  

  # GET /customersps/1/foodsps/new
  def new
@customersp = Customersp.find(params[:customersp_id])
# Associate an order object with customersp 1
@foodsp = @customersp.foodsps.build

  end

# POST /customersps/1/foodsps 
  def create
    @customersp = Customersp.find(params[:customersp_id])
# For URL like /customersps/1/foodsps
# Populate an foodsp associate with customersp 1 with form data
# Customersp will be associated with the foodsp
@foodsp = @customersp.foodsps.build(params.require(:foodsp).permit(
:productsp, :pricesp, :expirysp, :caloriessp, :proteinssp, :sugarsp, :fatsp))

logger = SpLogger.instance
logger.logInformation(" A new food is added:" + @foodsp.productsp + @foodsp.pricesp + @foodsp.expirysp)


if @foodsp.save
# Save the foodsp successfully
redirect_to customersp_foodsp_url(@customersp, @foodsp)
else
render :action => "new"
end

end

# GET /customersps/1/foodsps/2/edit
def edit
@customersp = Customersp.find(params[:customersp_id])
# For URL like /customersps/1/foodsps/2/edit
# Get foodsp id=2 for customersp 1
@foodsp = @customersp.foodsps.find(params[:id])
end

  # PUT /customers/1/orders/2
  def update
    @customersp = Customersp.find(params[:customersp_id])
@foodsp = Foodsp.find(params[:id])
if @foodsp.update_attributes(params.require(:foodsp).permit(
:product, :pricesp, :expirysp, :caloriessp, :proteinssp, :sugarsp, :fatsp))
# Save the order successfully
redirect_to customersp_foodsp_url(@customersp, @foodsp)
else
render :action => "edit"
end
end

 # DELETE /customersps/1/foodsps/2
def destroy
@customersp = Customersp.find(params[:customersp_id])
@foodsp = Foodsp.find(params[:id])
@foodsp.destroy
respond_to do |format|
format.html { redirect_to customersp_foodsps_path(@customersp) }
format.xml { head :ok }
end
end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foodsp
      @foodsp = Foodsp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foodsp_params
      params.require(:foodsp).permit(:productsp, :pricesp, :expirysp, :caloriessp, :proteinssp, :sugarsp, :fatsp, :customersp_id)
    end