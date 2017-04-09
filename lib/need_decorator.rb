# the concret component we would like to decorate, a car in our example
class BasicNeed
	def initialize(cost, manufacturer, color)
		@cost = cost
		@model = manufacturer
		@color = color
		@description = "basic need"
	end
	
	# getter method
	def cost
		return @cost
	end
	
	def details
		return @description + "; " + @model + "; " + @color + ": #{@cost}"
	end	
end

# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class NeedDecorator
	def initialize(real_need)
		@real_need = real_need
		@extra_cost = 0
		@feature = "no extra feature"
	end

    # override the cost method to include the cost of the extra feature	
	def cost
		return @extra_cost + @real_need.cost
	end
	
	# override the details method to include the description of the extra feature
	def details
		return @feature + ". " + @real_need.details
	end
	
end


# a concrete decorator
class MilkDecorator < NeedDecorator
	def initialize(real_need)
		super(real_need)
		@feature = "milk"
		@extra_cost = 3
	end
	
	# override the details method to include the description of the extra feature and its corresponding price
	def details
		return @feature + ": #{@extra_cost} + " + @real_need.details  
	end	
end

# another concrete decorator
class EggDecorator < NeedDecorator
	def initialize(real_need)
		super(real_need)
		@feature = "egg"
		@extra_cost = 5
	end
	
	# override the details method to include the description of the extra feature and its corresponding price
	def details
		return @feature + ": #{@extra_cost} + " + @real_need.details  
	end	
end

# another concrete decorator
class BreadDecorator < NeedDecorator
	def initialize(real_need)
		super(real_need)
		@feature = "bread"
		@extra_cost = 2
	end
	
	# override the details method to include the description of the extra feature and its corresponding price
	def details
		return @feature + ": #{@extra_cost} + " + @real_need.details  
	end	
end


