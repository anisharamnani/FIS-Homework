 ## when checking out, check the coupons and apply the discount 
 ## if the proper number of items is present
 def check_coupons (cart, coupons)
  # what should the paramater be? 
 	# check if the number of coupons = the count number 
 	# if the replace the number of 
 	if coupons.nil?
 		return 0
 	end 
 	cost = 0 
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