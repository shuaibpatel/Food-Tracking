class FatintakeController < ApplicationController


  
  def checkFatIntakeSP
  
  end 
  
  def isFatCal

		@weight= params[:check_number]

		@fatty=CheckBMR.weight(@weight.to_i)



 end	

end


