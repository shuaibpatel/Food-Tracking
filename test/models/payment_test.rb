require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
   
      test "must not save a payment when forename firstname and lastname
are not provided" do
payment = Payment.new(firstname: "John",
lastname: "xyz",)
assert_equal(false, payment.save, "saved the customer even
though at least one of the forename,
surname and/or email were not provided!")
end
end
