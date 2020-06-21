require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)
  
 coupons.each do |elements| #take each coupon 
   
    current_item = find_item_by_name_in_collection(elements[:item], cart)
    if current_item[:count] >= elements[:num] # if we are more/equal num of items as the coupon
      remaining_items = current_item[:count] - elements[:num] #items coupon doesnt apply to 
      current_item[:count] = remaining_items #items coupon doesnt apply to

      item_with_coupon = {}
      item_with_coupon[:item] = "#{elements[:item]} W/COUPON"
      item_with_coupon[:price] = (elements[:cost] / elements[:num])
      item_with_coupon[:clearance] = current_item[:clearance]
      item_with_coupon[:count] = elements[:num]
  
      cart << item_with_coupon
    end
  end
 return cart
end

def apply_clearance(cart)
cart.each do|items|
  if items[:clearance] == true 
   items[:price] = items[:price] * 0.8 
   items[:price] = items[:price].round(2)
  end
end
return cart
end

def checkout(cart, coupons)
grand_total = 0
  
  consolidated_cart = consolidate_cart(cart)

  consolidated_coupon_cart = apply_coupons(consolidated_cart, coupons)

  final_cart = apply_clearance(consolidated_coupon_cart)

    final_cart.each do |elements|
      item_price = elements[:price] * elements[:count]
      grand_total = grand_total + item_price
    end

  if grand_total > 100
   grand_total = grand_total * 0.9
  end
  
 return grand_total 
end
