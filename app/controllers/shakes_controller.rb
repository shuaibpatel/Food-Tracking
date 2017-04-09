require 'my_logger'
require 'shake_decorator'
class ShakesController < ApplicationController
  before_action :set_shake, only: [:show, :edit, :update, :destroy]

  # GET /shakes
  # GET /shakes.json
  def index
    @shakes = Shake.all
  end

  # GET /shakes/1
  # GET /shakes/1.json
  def show
  end

  # GET /shakes/new
  def new
    @shake = Shake.new
  end

  # GET /shakes/1/edit
  def edit
  end

  # POST /shakes
  # POST /shakes.json
  def create
  
     @shake = Shake.new()
     @shake.Name=params[:shake][:Name]
     @shake.Cost=params[:shake][:Cost]
     @shake.Calories=params[:shake][:Calories]
   
  
   # create an instance/object of a BasicCar
   


     myShake=BasicShake.new(@shake.Cost,@shake.Calories)


    #add the extra features to the new car
   if params[:shake][:caramel].to_s.length > 0 then
     myShake = CaramelDecorator.new(myShake)
   end
   if params[:shake][:pbutter].to_s.length > 0 then
     myShake = PeanutbutterDecorator.new(myShake)
   end
   if params[:shake][:cream].to_s.length > 0 then
     myShake = CreamDecorator.new(myShake)
   end
      #populate the cost and the description details
    @shake.Cost = myShake.cost
    #@shake.Calories=myShake.calories

       #@shake.description = myShake.details

     #retrieve the instance/object of the MyLogger class
     
       logger = MyLogger.instance
       logger.logInformation("A new Shake requested: " + @shake.Name)
 
  
 

    respond_to do |format|
      if @shake.save
        format.html { redirect_to @shake, notice: 'Shake was successfully created.' }
        format.json { render :show, status: :created, location: @shake }
      else
        format.html { render :new }
        format.json { render json: @shake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shakes/1
  # PATCH/PUT /shakes/1.json
  def update
      @shake.Name=params[:shake][:Name]
     @shake.Cost=params[:shake][:Cost]
     @shake.Calories=params[:shake][:Calories]
   
# create an instance/object of a BasicCar
# here I hard-code the cost of a car,
# namely all my basic cars are going to cost 15000
   myShake=BasicShake.new(@shake.Cost,@shake.Calories)
# add the extra features to the myCar object if the user selected them
# we use an implementation of the decorator pattern
# to dynamically provide the extra features to a car
# each of the check-boxex the user checks is implemented as a decoration
  if params[:shake][:caramel].to_s.length > 0 then
     myShake = CaramelDecorator.new(myShake)
   end
   if params[:shake][:pbutter].to_s.length > 0 then
     myShake = PeanutbutterDecorator.new(myShake)
   end
   if params[:shake][:cream].to_s.length > 0 then
     myShake = CreamDecorator.new(myShake)
   end
     
     ## update the cost and the description details
    @shake.Cost = myShake.cost
   # build a hash with the updated information of the car
updated_information = {
 "Name" => @shake.Name,
 
 "Cost" => @shake.Cost,
  "Calories" => @shake.Calories

}
    
    
    
    
    
    respond_to do |format|
      if @shake.update(shake_params)
        format.html { redirect_to @shake, notice: 'Shake was successfully updated.' }
        format.json { render :show, status: :ok, location: @shake }
      else
        format.html { render :edit }
        format.json { render json: @shake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shakes/1
  # DELETE /shakes/1.json
  def destroy
    @shake.destroy
    respond_to do |format|
      format.html { redirect_to shakes_url, notice: 'Shake was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shake
      @shake = Shake.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shake_params
      params.require(:shake).permit(:Name, :Cost, :Calories, :Description)
    end
end
