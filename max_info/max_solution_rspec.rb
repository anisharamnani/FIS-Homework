require './max_solution'

describe "#maximum" do
	it "should return the maximum value from the array" do 
		expect(maximum([1,2,3])).to eq(3) 
	end 
	it "should return the maximum value even if two values are the same" do 
		expect(maximum([1,2,2])).to eq(2)
	end 
end 

describe Array, "#maximum" do
	it "should return the maximum value from the array" do 
		expect(maximum([1,2,3])).to eq(3) 
	end 
	it "should return the maximum value even if two values are the same" do 
		expect(maximum([1,2,2])).to eq(2)
	end 
end 

