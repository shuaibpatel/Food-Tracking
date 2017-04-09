class Need < ActiveRecord::Base

validates :firstname, :description, presence: true

validates :lastname, :manufacturer, :color, format: { with: /\A[0-9]+\z/,
message: "accepts digits only!" }


validates_each :firstname, :description do |record, attr, value|
record.errors.add(attr, 'must contain only letters!') if
value =~ /[^\A[a-zA-Z]+\z]/
end

end
