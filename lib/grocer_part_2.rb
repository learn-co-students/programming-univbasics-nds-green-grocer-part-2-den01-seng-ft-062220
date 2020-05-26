require_relative './part_1_solution.rb'
require 'pry'
def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |hash|
    name = hash[:item]
    coupons.each do |coupon|  
      if hash[:item] == coupon[:item] && hash[:count] >= coupon[:num]
        hash[:count] -= coupon[:num]
        cart << {:item => "#{coupon[:item]} W/COUPON", :price => (coupon[:cost] / coupon[:num]), :clearance => hash[:clearance], :count => coupon[:num]}
      end
    end
  end
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  cart.each do |hash|
    if hash[:clearance] == true
      hash[:price] *= 0.8
      hash[:price]
    end
  end
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  new_cart = consolidate_cart(cart)
  new_w_coupons = apply_coupons(new_cart, coupons)
  clearance_cart = apply_clearance(new_w_coupons)
  total = 0
  clearance_cart.each do |hash|
    total += hash[:price].round(2) * hash[:count]
  end
  if total > 100
    total *= 0.9
  end
  total
    
  
end
