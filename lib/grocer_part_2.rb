require_relative './part_1_solution.rb'

def apply_coupons(cart, coupons)

counter = 0 

while counter < coupons.length
  new_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
  coupon_item_name = "#{coupons[counter][:item]} W/COUPON"
  new_item_couponed = find_item_by_name_in_collection(new_item_couponed, cart)
  if new_item && new_item[:count] >= coupons[counter][:num]
    if new_item_couponed
      new_item_couponed[:count] += coupons[counter][:num]
      new_item[:count] -= coupons[counter][:num]
    else
      new_item_couponed = {
        :item => coupon_item_name,
        :price => coupons[counter][:cost] / coupons[counter][:num],
        :count => coupons[counter][:num],
        :clearance => new_item[:clearance]
      }
      cart << new_item_couponed
      new_item[:count] -= coupons[counter][:num]
      end
    end
    counter += 1 
  end
  cart
end

def apply_clearance(cart)

counter = 0

while counter < cart.length
  if cart[counter][:clearance]
    cart[counter][:price] = (cart[counter][:price] - (cart[counter][:price] * 0.20)).round(2)
    end
    counter += 1 
  end
  cart
end

def checkout(cart, coupons)

consolidated = consolidate_cart(cart)
couponed = apply_coupons(consolidated, coupons)
final = apply_clearance(couponed)

total = 0 
counter = 0 

while counter < final.length
  total += final[counter][:price] * final[counter][:count]
  counter += 1 
  end
  if total > 100
    total -= (total * 0.10)
  end
  total
end
