require 'donation_decorator_example'
# the concret component we would like to decorate, a car in our example
class BasicDonation
	def initialize(cost)
		@cost = cost
		@description = "Donation"
	end
	
	# getter method
	def cost
		return @cost
	end
	
	def details
		return @description + "; " + ": #{@cost}"
	end	
end

# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class DonationDecorator
	def initialize(real_donation)
		@real_donation = real_donation
		@extra_cost = 0
		@feature = "No extra Donation"
	end

    # override the cost method to include the cost of the extra feature	
	def cost
		return @extra_cost + @real_donation.cost
	end
	
	# override the details method to include the description of the extra feature
	def details
		return @feature + ". " + @real_donation.details
	end
	
end


# a concrete decorator
class ChildDecorator < DonationDecorator
	def initialize(real_donation)
		super(real_donation)
		@feature = "Save Child"
		@extra_cost = 50
	end
	
	# override the details method to include the description of the extra feature and its corresponding price
	def details
		return @feature + ": #{@extra_cost} + " + @real_donation.details  
	end	
end

# another concrete decorator
class OldDecorator < DonationDecorator
	def initialize(real_donation)
		super(real_donation)
		@feature = "Help Old People"
		@extra_cost = 100
	end
	
	# override the details method to include the description of the extra feature and its corresponding price
	def details
		return @feature + ": #{@extra_cost} + " + @real_donation.details  
	end	
end

