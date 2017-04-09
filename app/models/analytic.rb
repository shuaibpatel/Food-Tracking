class Analytic < ActiveRecord::Base
    
    validates :Food, :Day, :Protein, :Carbohydrates,:Fats, :Calories, :Country, presence: true
    
    validates :Protein,:Carbohydrates,:Fats,:Calories, format: { with: /\A[0-9]+\z/,
     message: "accepts digits only!" }
     
     
     validates_each :Food, :Day , :Country  do |record, attr, value|
record.errors.add(attr, 'must contain only letters!') if
value =~ /[^\A[a-zA-Z]+\z]/
end

end
