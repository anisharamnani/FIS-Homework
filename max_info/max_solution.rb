# prereqs arrays, methods, conditional logic
# part I. implement a maximum method that takes and array and returns the largest element of the array
# part II. reimplement this method as an instance method on the array class

def maximum(arr)
	arr.sort! 
	arr.last
end

# Alternative for max =] 
# max_num = 0
# arr.each do |num|
# 	if num > max_num 
# 	max_num = num
# 	end 
# end 
# max_num


# now rewrite this as a method on the array class
class Array
  def maximum
 		sort.last
  end
end
