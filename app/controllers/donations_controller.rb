require 'donation_decorator_example'
class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  # GET /donations
  # GET /donations.json
  def index
    @donations = Donation.all
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
  end

  # GET /donations/new
  def new
    @donation = Donation.new
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations
  # POST /donations.json
def create
  @donation = Donation.new()
  @donation.firstname = params[:donation][:firstname]
  @donation.lastname = params[:donation][:lastname]
  @donation.cost = params[:donation][:cost]
  # create an instance/object of a BasicCar
  myDonation = BasicDonation.new(@donation.cost)
  # add the extra features to the new car
  if params[:donation][:SaveChild].to_s.length > 0 then
    myDonation = ChildDecorator.new(myDonation)
  end
  if params[:donation][:HelpOldPeople].to_s.length > 0 then
    myDonation = OldDecorator.new(myDonation)
  end
## populate the cost and the description details
    @donation.cost = myDonation.cost
    @donation.description = myDonation.details
    
  

  respond_to do |format|
      if @donation.save
        format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
        format.json { render :show, status: :created, location: @donation }
      else
        format.html { render :new }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
end

  # PATCH/PUT /donations/1
  # PATCH/PUT /donations/1.json
  def update
    
    # update the instance variables with the information
# user provided in the form
# retrieve each value from the params hash
@donation.firstname = params[:donation][:firstname]
@donation.lastname = params[:donation][:lastname]
@donation.cost = params[:donation][:cost]
# create an instance/object of a BasicCar
# here I hard-code the cost of a car,
# namely all my basic cars are going to cost 15000
myDonation = BasicDonation.new(15)
# add the extra features to the myCar object if the user selected them
# we use an implementation of the decorator pattern
# to dynamically provide the extra features to a car
# each of the check-boxex the user checks is implemented as a decoration
if params[:donation][:SvaeChild].to_s.length > 0 then
myDonation = ChildDecorator.new(myDonation)
end
if params[:donation][:HelpOldPeople].to_s.length > 0 then
myDonation = OldDecorator.new(myDonation)
end

## update the cost and the description details
@donation.cost = myDonation.cost
@donation.description = myDonation.details

# build a hash with the updated information of the car
updated_information = {
"firstname" => @donation.firstname,
"lastname" => @donation.lastname,

"cost" => @donation.cost,


}
  respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:firstname, :lastname, :cost, :description)
    end
  end