class Review < ActiveRecord::Base
has_many :orders
validates :name, :email, :phone, :description, presence: true
end

