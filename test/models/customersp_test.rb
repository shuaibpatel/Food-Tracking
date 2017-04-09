require 'test_helper'

class CustomerspTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "must not save a customer when name surname and email
are not provided" do
customersp = Customersp.new(namesp: "John",
emailsp: "john.davidson@email.ie")
assert_equal(false, customersp.save, "saved the customer even
though at least one of the name,
surname and/or email were not provided!")
end

test "must not save customer if phone contains non-digits" do
customersp = Customersp.new(namesp: "John",
surnamesp: "Davidson",
phonesp: "12we3r",
emailsp: "john.davidson@email.ie")
assert( !customersp.save, "saved the customer, even though
the phone number is not valid!")
end

test "must allow only letters in forename and surname" do
customersp = Customer.new(namesp: "John1",surnamesp: "Davidson1",
phonesp: "123456",
emailsp: "john.davidson@email.ie")
assert_equal(false, customersp.save, "saved the customer even
though name contains non-letters!")
end

end
