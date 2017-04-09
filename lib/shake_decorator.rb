require_relative 'shake_decorator_example'

# create a basic car instance/object


shake=BasicShake.new(15,175)
puts shake.cost
puts shake.details





shake2=CaramelDecorator.new(shake)
puts shake2.cost
puts shake2.details
puts



shake3=PeanutbutterDecorator.new(shake)
puts shake3.cost
puts shake3.details
puts




shake4=CreamDecorator.new(shake2)
puts shake4.cost
puts shake4.details
puts


# create a basic car instance/object

c=BasicShake.new(10,200)
puts c.cost
puts c.details
puts

# add extra features to the same car
c = CaramelDecorator.new(c)
puts c.cost
puts c.details
puts 

# add extra features to the same car
c = PeanutbutterDecorator.new(c)
puts c.cost
puts c.details
puts 

# add extra features to the same car
c = CreamDecorator.new(c)
puts c.cost
puts c.details
puts 
