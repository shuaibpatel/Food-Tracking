require_relative 'donation_decorator'

# create a basic car instance/object
donation = BasicDonation.new(15)
puts donation.cost
puts donation.details


donation2 = ChildDecorator.new(donation)
puts donation2.cost
puts donation2.details
puts

donation3 = OldDecorator.new(donation)
puts donation3.cost
puts donation3.details
puts 

