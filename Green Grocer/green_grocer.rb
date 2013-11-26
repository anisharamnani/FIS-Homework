# Objectives: 
# Create a checkout method to calculate the total cost of a cart of items and apply discounts and coupons as necessary.

# Dr. Steve Bruhle, your green grocer, isn't ready, but you are!

# Skills: 
# any?, all?, none?, each, map/collect

# Instructions:
# Code generates a random cart of items and a random set of coupons. Implement a method checkout to calculate total cost of a cart of items and apply discounts and coupons as necessary.

# Code:

ITEMS = [  {"AVOCADO" => {:price => 3.00, :clearance => true}},
			{"KALE" => {:price => 3.00,:clearance => false}},
			{"BLACK_BEANS" => {:price => 2.50,:clearance => false}},
			{"ALMONDS" => {:price => 9.00, :clearance => false}},
			{"TEMPEH" => {:price => 3.00,:clearance => true}},
			{"CHEESE" => {:price => 6.50,:clearance => false}},
			{"BEER" => {:price => 13.00, :clearance => false}},
			{"PEANUTBUTTER" => {:price => 3.00,:clearance => true}},
			{"BEETS" => {:price => 2.50,:clearance => false}}]

COUPS = [	{:item=>"AVOCADO", :num=>2, :cost=>5.00},
			{:item=>"BEER", :num=>2, :cost=>20.00},
			{:item=>"CHEESE", :num=>3, :cost=>15.00}]

#randomly generates a cart of items
def generateCart
	cart = []
	rand(20).times do
		cart.push(ITEMS.sample)  
	end
	cart
end

#randomly generates set of coupons
def generateCoups
	coups = []
	rand(2).times do
		coups.push(COUPS.sample)
	end
	coups
end

# updates item cost if they are on clearance

# counts multiples of an item
def count_multiples cart 
	counts = {}
	cart.each do |item|
		item.each do |name, item_specs|
			counts[name] = cart.select{|item_2| item_2 == item}.size
		end 
	end
	counts  
end

# updates the items to have the new count
def update_multiples (cart, counts)
	cart.uniq! 
	cart.each do |item|
		item.each do |name, item_specs|
			counts.each do |item2, number|
				item_specs[:count] = number if item2 == name 
			end 
		end 
	end 
end 


# checks if there are coupons and then updates the cost to take into account the coupons =] 
 def check_coupons (cart, coupons)
 	if coupons.nil?
 		return 0
 	end 
 	cost = 0 # we set cost = 0 because it is the first time we are referring to cost. 
 	cart.each do |item|
 		item.each do |name, item_specs|
 			coupons.each do |coupon|
	 			if name == coupon[:item] && item_specs[:count] >= coupon[:num]
	 				cost += coupon[:cost]
	 				item_specs[:count] = item_specs[:count] - coupon[:num]
	 			end
	 		end
 		end 
 	end 
 	cost
 end 

 def clearance_items cart, cost
	cart.each do |item|
		item.each do |name, item_specs|
			if item_specs[:clearance] # no need to write == true b/c it is assumed 
				cost += (item_specs[:price] * item_specs[:count]) * 0.8
				item_specs[:count] = 0 # we set it to 0 so we don't count it again in the final checkout. 
			end 
		end 
	end
	cost 
 end 

 def full_price_items cart, cost
	cart.each do |item|
		item.each do |name, item_specs|
			cost += item_specs[:price] * item_specs[:count]
		end 
	end
	cost 
 end 

def greater_than_five cart, cost 
	greater_5 = false
	cart.each do |item|
		item.each do |item_name, item_specs|
			greater_5 = true if item_specs[:price] > 5
		end 
	end 
	greater_5 || cost <= 10 ? cost : cost-10
end 

# checkout method: most likely will be updated to take into account coupons and what no 
# original checkout method. no longer usuable b/c of all the difference functions
# def checkout cart 
# 	total_cost = []
# 	cart.each do |item|
# 		item.each do |item_name, item_specs|
# 			total_cost << item_specs[:price] 
# 		end 
# 	end 
# 	total_cost.reduce(:+)
# end 

def checkout(cart, coupons)
	no_coupons = check_coupons(cart, coupons)
	clearance_items = clearance_items(cart, no_coupons)
	total = full_price_items(cart, clearance_items)
	greater_than_five(cart, total)
end 

cart = generateCart
count = count_multiples(cart)
cart = update_multiples(cart, count)
coupons = generateCoups 

puts checkout(cart, coupons)

##the cart is currently an array of individual items, translate it into a hash that includes the counts for each item
  # For example if your cart was [  {"AVOCADO" => {:price => 3.00, :clearance => true}}, {"AVOCADO" => {:price => 3.00, :clearance => true}}]
  # it would become {"AVOCADO" => {:price => 3.00, :clearance => true, :count => 2}}
##create a checkout method that calculates the total cost of the cart
##when checking out, check the coupons and apply the discount if the proper number of items is present
##if any of the items are on clearance add a 20% discount
##if the customer has 2 of the same coupon, triple the discount
##if none of the items purchased have a unit price greater than 5$ give the customer a 10$ discount off the whole cart

