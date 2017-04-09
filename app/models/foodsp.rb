class Foodsp < ActiveRecord::Base
  belongs_to :customersp


validates :productsp, presence: true

# validate that the nutients and price  only contains digits
# tests if the value of the phone matches
# the regular expression given via with:
validates :pricesp, :caloriessp, :proteinssp, :sugarsp,:fatsp,  format: { with: /\A[0-9]+\z/,
message: "accepts digits only!" }

# we have to add the error so that the record becomes invalid
# when the value of the attribute does not match the
# regular expression
validates_each :productsp do |record, attr, value|
record.errors.add(attr, 'must contain only letters!') if
value =~ /[^\A[a-zA-Z]+\z]/
end


end
