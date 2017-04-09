require 'sp_logger'
require 'need_decorator'
class NeedsController < ApplicationController
  before_action :set_need, only: [:show, :edit, :update, :destroy]

  # GET /needs
  # GET /needs.json
  def index
    @needs = Need.all
  end

  # GET /needs/1
  # GET /needs/1.json
  def show
  end

  # GET /needs/new
  def new
    @need = Need.new
  end

  # GET /needs/1/edit
  def edit
  end

  # POST /needs
  # POST /needs.json
  def create


@need = Need.new()
@need.firstname = params[:need][:firstname]
@need.lastname = params[:need][:lastname]
@need.color = params[:need][:color]
@need.manufacturer = params[:need][:manufacturer]
# create an instance/object of a BasicCar
myNeed = BasicNeed.new(2000, @need.manufacturer, @need.color)
# add the extra features to the new need
if params[:need][:milk].to_s.length > 0 then
myNeed = MilkDecorator.new(myNeed)
end
if params[:need][:egg].to_s.length > 0 then
myNeed = EggDecorator.new(myNeed)
end
if params[:need][:bread].to_s.length > 0 then
myNeed = BreadDecorator.new(myNeed)
end
## populate the cost and the description details
@need.cost = myNeed.cost
@need.description = myNeed.details

# Singleton Logg
logger = SpLogger.instance
logger.logInformation(" A new Basic Need is added:" + @need.description)

respond_to do |format|
if @need.save
format.html { redirect_to @need, notice: 'need was successfully created.'}
format.json { render :show, status: :created, location: @need }
else
format.html { render :new }

format.json { render json: @need.errors, status: :unprocessable_entity }
end
end
end

  # PATCH/PUT /needs/1
  # PATCH/PUT /needs/1.json
  def update
    # update the instance variables with the information
# user provided in the form
# retrieve each value from the params hash
@need.firstname = params[:need][:firstname]
@need.lastname = params[:need][:lastname]
@need.color = params[:need][:color]
@need.manufacturer = params[:need][:manufacturer]
# create an instance/object of a BasicNeed
# here I hard-code the cost of a need,
# namely all my basic cars are going to cost 15000
myNeed = BasicNeed.new(20, @need.manufacturer, @need.color)
# add the extra features to the myNeed object if the user selected them
# we use an implementation of the decorator pattern
# to dynamically provide the extra features to a need
# each of the check-boxex the user checks is implemented as a decoration
if params[:need][:milk].to_s.length > 0 then
myNeed = MilkDecorator.new(myNeed)
end
if params[:need][:egg].to_s.length > 0 then
myNeed = EggDecorator.new(myNeed)
end
if params[:need][:bread].to_s.length > 0 then
myNeed = BreadDecorator.new(myNeed)
end
## update the cost and the description details
@need.cost = myNeed.cost
@need.description = myNeed.details

# build a hash with the updated information of the car
updated_information = {
"firstname" => @need.firstname,
"lastname" => @need.lastname,
"manufacturer" => @need.manufacturer,
"cost" => @need.cost,
"description" => @need.description,
"color" => @need.color
}
respond_to do |format|
# call the method update() of the ActiveRecord instance
# to update the car with the new information
# note that the method update() of the ActiveRecord receives
# the hash we created above
if @need.update(updated_information)
format.html { redirect_to @need, notice: 'need was successfully updated.' }
format.json { render :show, status: :ok, location: @need }
else
format.html { render :edit }
format.json { render json: @need.errors, status: :unprocessable_entity }
end
end
end

  # DELETE /needs/1
  # DELETE /needs/1.json
  def destroy
    @need.destroy
    respond_to do |format|
      format.html { redirect_to needs_url, notice: 'Need was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_need
      @need = Need.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def need_params
      params.require(:need).permit(:firstname, :lastname, :manufacturer, :cost, :description, :color)
    end
end
