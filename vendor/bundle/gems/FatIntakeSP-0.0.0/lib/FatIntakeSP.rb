module CheckFat
	def calculate
		puts "We will find Total Fats intake for you"
		puts "Enter Fats"
		num = gets.chomp
		puts "Enter Calories"
		num2 = gets.chomp
		gram = num * 9
		total = (num2/gram)*100
		puts " Your total Fat Intake percent is :"+total
	end
end