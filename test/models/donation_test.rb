require 'test_helper'

class DonationTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
   end
   
   test "must not save a donation when forename firstname and lastname
are not provided" do
donation = Donation.new(firstname: "John",
lastname: "xyz")
assert_equal(false, donation.save, "saved the customer even
though at least one of the forename,
surname and/or email were not provided!")
end
end
