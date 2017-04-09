require 'test_helper'

class FoodspTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

test "must not save a foodsp when product is not provided" do
foodsp = Foodsp.new(productsp: "John")
assert_equal(false, foodsp.save, "saved the food even
though at least one of the product,not provided!")
end

test "must allow only letters in product" do
foodsp = Foodsp.new(productsp: "John1")
assert_equal(false, foodsp.save, "saved the food even
though name contains non-letters!")
end

test "must not save food if nutrients and price contains non-digits" do
foodsp = Foodsp.new(productsp: "John",pricesp: "12we3r",caloriessp: "123456",proteinssp: "123456",sugarsp: "123456",fatsp: "123456")
assert( !foodsp.save, "saved the customer, even though
the details number is not valid!")
end

end
