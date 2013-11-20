require './square_arrays_solution' 

describe "#square_array" do 
	it "should return the array [1, 2, 3] with squared values" do 
		expect(square_array([1,2,3])).to eq([1,4,9])
	end 
	it "should return the array [0, 1, 2] with squared values" do
		expect(square_array([2,3,4])).to eq([4,9,16])
	end 
end
