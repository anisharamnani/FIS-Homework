# Instructions:
# Return an array that contains the squares of all elements in an array?

array = [1,2,3]

def square_array(some_array)
	squared_num = []
	some_array.each do |num|
		squared_num << num**2 
	end 
	squared_num 
end