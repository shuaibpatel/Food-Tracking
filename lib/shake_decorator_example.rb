# the concret component we would like to decorate, a car in our example
require 'shake_decorator'

class BasicShake
	
   def initialize(cost,calories)
		@cost=cost
		@calories=calories
		@description="Basic Shake"

	end	
	
	# getter method
	def cost
		return @cost
	end

		
	
	def details
		return @description + ": "  + ": #{@cost}"
	end	
end

# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class ShakeDecorator
	def initialize(real_shake)
		@real_shake = real_shake
		@extra_cost = 0
		
		@feature = "no extra feature"
	end

    # override the cost method to include the cost of the extra feature	
	def cost
		return @extra_cost + @real_shake.cost
	end

	def calories
        return @extra_cal + @real_shake.calories
	end	
	
	# override the details method to include the description of the extra feature
	def details
		return @feature + ". " + @real_shake.details
	end
	
end


# a concrete decorator
class CaramelDecorator < ShakeDecorator
	def initialize(real_shake)
		super(real_shake)
		@feature = "Caramel chew chew taste"
		@extra_cost = 3.5
		

	end
	
	# override the details method to include the description of the extra feature and its corresponding price
	def details
		return @feature + ": #{@extra_cost} + " + @real_shake.details  
	end	
end

# another concrete decorator
class PeanutbutterDecorator < ShakeDecorator
	def initialize(real_shake)
		super(real_shake)
		@feature = "Exta scoops of crunchy peanut butter"
		@extra_cost = 3.5
		
	end
	
	# override the details method to include the description of the extra feature and its corresponding price
	def details
		return @feature + ": #{@extra_cost} + " + @real_shake.details  
	end	
end

# another concrete decorator
class CreamDecorator < ShakeDecorator
	def initialize(real_shake)
		super(real_shake)
		@feature = "Layers of Cream"
		@extra_cost = 3.5
		
	end
	
	# override the details method to include the description of the extra feature and its corresponding price
	def details
		return @feature + ": #{@extra_cost} + " + @real_shake.details  
	end	
end


