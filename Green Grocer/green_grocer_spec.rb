##the cart is currently an array of individual items, translate it into a hash that includes the counts for each item
  # For example if your cart was [  {"AVOCADO" => {:price => 3.00, :clearance => true}}, {"AVOCADO" => {:price => 3.00, :clearance => true}}]
  # it would become {"AVOCADO" => {:price => 3.00, :clearance => true, :count => 2}
##create a checkout method that calculates the total cost of the cart
##when checking out, check the coupons and apply the discount if the proper number of items is present
##if any of the items are on clearance add a 20% discount
##if the customer has 2 of the same coupon, triple the discount
##if none of the items purchased have a unit price greater than 5$ give the customer a 10$ discount off the whole cart

require './green_grocer'

describe "#count_multiples" do 
	it "should count how many of an item exist." do
		cart = [{"AVOCADO" => {:price => 3.00, :clearance => true}},{"AVOCADO" => {:price => 3.00, :clearance => true}}]
		expect(count_multiples(cart)).to eq({"AVOCADO"=>2})
	end
end 

describe "#update_multiples" do 
	it "should update the cart so there are no longer duplicates" do
		cart = [{"AVOCADO" => {:price => 3.00, :clearance => true}},{"AVOCADO" => {:price => 3.00, :clearance => true}}]
		counts = {"AVOCADO"=>2}
		expect(update_multiples(cart, counts)).to eq([{"AVOCADO" => {:price => 3.00, :clearance => true, :count => 2}}])
	end 
end 

describe "#check_coupons" do 
	it "should count the number of coupons and then return the cost if there are coupons" do
		cart = [{"AVOCADO" => {:price => 3.00, :clearance => true, :count => 2}}]
		coupons = [{:item=>"AVOCADO", :num=>2, :cost=>5.00}]
		expect(check_coupons(cart, coupons)).to eq(5.00)
	end 
end 

describe "#clearance_items" do 
	it "should check if an item is on clearance and then update the cost if so." do 
		cart = [{"AVOCADO" => {:price => 3.00, :clearance => true, :count => 2}}]
		cost = 0 
		expect(clearance_items(cart, cost)).to eq(4.800000000000001)
	end 
end 

describe "#full_price_items" do 
	it "should mutliply the count times the cost in order to get the cost of the items" do
		cart = ["PEANUTBUTTER" => {:price => 3.00,:clearance => true, :count => 1}]
		cost = 0 
		expect(full_price_items(cart, cost)).to eq(3.00)
	end 
end 

describe "#greater_than_five" do
	it "should take off 10 dollars if none of the items in the cart have a price over 10" do 
		cart = [{"KALE" => {:price => 3.00,:clearance => false}},
				{"BLACK_BEANS" => {:price => 2.50,:clearance => false}}]
		cost = 20 
		expect(greater_than_five(cart, cost)).to eq(10)
	end 
end 

# old checkout method test: 
# describe "#checkout" do
# 	it "should return the cost at checkout" do 
# 		cart = ([{"AVOCADO" => {:price => 3.00, :clearance => true}},
# 			{"KALE" => {:price => 3.00,:clearance => false}}]) 
# 		expect(checkout(cart)).to eq(6.00)
# 	end 
# end 