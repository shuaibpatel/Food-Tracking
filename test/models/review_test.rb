require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end
  test "must not save a review when name email phone and description
are not provided" do
review = Review.new(name: "John",
email: "john.davidson@email.ie", phone:7894561230, description:"xyzabcdefghijklmnopqrstuvxyz")
assert_equal(false, review.save, "saved the review even
though at least one of the name,
email phone and/or description were not provided!")
end
end
