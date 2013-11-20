# prereqs arrays, methods, conditional logic, chaining
# Stop this code from throwing an exception. 

def some_method
  [1, 4, nil, 9, 16, nil].___.inject(0) {|sum, number| sum + number}
end
