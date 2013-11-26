ITEMS = [  {"AVOCADO" => {:price => 3.00, :clearance_items => true}},
    {"KALE" => {:price => 3.00,:clearance_items => false}},
    {"BLACK_BEANS" => {:price => 2.50,:clearance_items => false}},
    {"ALMONDS" => {:price => 9.00, :clearance_items => false}},
    {"TEMPEH" => {:price => 3.00,:clearance_items => true}},
    {"CHEESE" => {:price => 6.50,:clearance_items => false}},
    {"BEER" => {:price => 13.00, :clearance_items => false}},
    {"PEANUTBUTTER" => {:price => 3.00,:clearance_items => true}},
    {"BEETS" => {:price => 2.50,:clearance_items => false}}]

COUPS = [  {:item=>"AVOCADO", :num=>2, :cost=>5.00},
    {:item=>"BEER", :num=>2, :cost=>20.00},
    {:item=>"CHEESE", :num=>3, :cost=>15.00}]

#randomly generates a cart of items
def generate_cart
  cart = []
  rand(1..20).times do
    cart.push(ITEMS.sample)  
  end
  cart
end

#randomly generates set of coupons
def generate_coupons
  update_coupons_for_clearance_discount
  coups = []
  rand(2).times do
    coups.push(COUPS.sample)
  end
  update_coupons_for_triple_discount(coups) if coups.size == 2
  coups
end

#updates coupons to reflect discount
# not necessary because you don't need to update the coupons 
def update_coupons_for_clearance_discount
  COUPS.each do |coupon|
    ITEMS.each do |items|
      items.each do |name, attributes|
        coupon[:cost] = coupon[:cost] * 0.8 if coupon[:item] == name && attributes[:clearance_items] == true
      end
    end
  end
end

#update coupons for triple discount
# note: not needed because of the way random works  
def update_coupons_for_triple_discount(coupons)
  if coupons[0] = coupons[1]
    coupons.delete_at(1)

    coupon = coupons[0]

    ITEMS.each do |items|
      items.each do |name, attributes|
        if coupon[:item] == name
          real_price = attributes[:price] * coupon[:num]
          new_price = coupon[:cost]
          percentage_discount = (real_price - new_price)/real_price
          coupon[:cost] = coupon[:cost] * (1 - (percentage_discount * 3))
        end
      end
    end
  end
  coupons
end

#returns count of items in cart
def count_cart_items(cart)
  counts = {}
  cart.each do |item|
    item.each do |name, attributes|
      counts[name] = cart.select{|other_item| other_item == item}.size
    end
  end
  counts
end

#adds count to the items in the cart
def update_cart_counts(cart, counts)
  cart.uniq!
  cart.each do |item|
    item.each do |name, attributes|
      counts.each do |item2, number|
        attributes[:count] = number if item2 == name
      end
    end
  end
end

#changes price for couponed items
def coupon_items(cart, coupons)
  cost = 0
  cart.each do |item|
    item.each do |name, attributes|
      unless coupons.nil?
        coupons.each do |coupon|
          if name == coupon[:item] && attributes[:count] >= coupon[:num]
            cost += coupon[:cost] * (attributes[:count]/coupon[:num])
            attributes[:count] = attributes[:count] % coupon[:num]
          end
        end
      end
    end
  end
  cost
end

#gives clearance_items discount
def clearance_items(cart, cost)
  cart.each do |item|
    item.each do |name, attribute|
      if attribute[:clearance]
        cost += (attribute[:price] * attribute[:count]) * 0.8
        attribute[:count] = 0
      end
    end
  end
  cost
end

#gives cost of normal items
def full_price_items(cart, cost)
  cart.each do |item|
    item.each do |name,attribute|
      cost += (attribute[:price] * attribute[:count])
    end
  end
  cost
end

#gives over 5 discount
def over_5_discount(cart, cost)
  over_5 = false

  cart.each do |item|
    item.each do |name, attribute| 
      over_5 = true if attribute[:price] > 5
    end
  end

  over_5 || cost <= 10 ? cost : cost - 10 # if over_5 = true or cost <= 10 --> cost otherwise, return the original cost
end

def checkout(cart, coupons)
  no_coupons = coupon_items(cart, coupons)
  clearance_items = clearance_items(cart, no_coupons)
  total = full_price_items(cart, clearance_items)
  over_5_discount(cart, total)
end

##the cart is currently an array of individual items, translate it into a hash that includes the counts for each item
  # For example if your cart was [  {"AVOCADO" => {:price => 3.00, :clearance_items => true}}, {"AVOCADO" => {:price => 3.00, :clearance_items => true}}]
  # it would become {"AVOCADO" => {:price => 3.00, :clearance_items => true}, :count => 2}
##create a checkout method that calculates the total cost of the cart
##when checking out, check the coupons and apply the discount if the proper number of items is present
##if any of the items are on clearance_items add a 20% discount
##if the customer has 2 of the same coupon, triple the discount
##if none of the items purchased have a unit price greater than 5$ give the customer a 10$ discount off the whole cart
Status API Training Shop Blog About © 2013 GitHub, Inc. Terms Privacy Security Contact 