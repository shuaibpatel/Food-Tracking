require 'test_helper'

class AnalyticTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end



 test "must not save a analytic when foodname day protein carb fats calorie and country
   are not provided" do
analytic = Analytic.new(Food: "John",
Day: "Monday" ,Protein: 8 , Carbohydrates: 8 , Fats: 9 , Calories: 100 , Country: "India")
assert_equal(false, analytic.save, "saved the customer even
though at least one of the forename,
surname and/or email were not provided!")
end


test "must not save customer if calories ,Fats ,Protein ,Catbohydrates  contains non-digits" do
analytic = Analytic.new(Food: "John",
Day: "Monday" ,Protein: "Jo" , Carbohydrates: "xss" , Fats: "sad" , Calories: "qwwq" , Country: "India")
assert( !analytic.save, "saved the analytic, even though
the  number is not valid!")
end

test "must not save customer if Day , Country  contains digits" do
analytic = Analytic.new(Food: "John",
Day: "Monday1" ,Protein: "Jo" , Carbohydrates: "xss" , Fats: "sad" , Calories: "qwwq" , Country: "India121")
assert_equal(false, analytic.save, "saved the analytic even
though name contains non-letters!")
end

end