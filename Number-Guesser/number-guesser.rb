
num = Random.new.rand(1..100)
# Should ask the user to enter a number between 1 and 100
puts "Please choose a number between 1 and 100"
# Should receive input from the user
user_num = gets.chomp.to_i
# Should tell the user if they were correct or incorrect
if num == user_num 
	puts "You are correct! You can see into the computer's brain!"
else 
	puts "You are incorrect. I am sorry. "
end 
