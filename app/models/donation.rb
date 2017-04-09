class Donation < ActiveRecord::Base
    
    has_many :orders
validates :firstname, :lastname, presence: true
end
