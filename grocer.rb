require 'pry'

def consolidate_cart(cart)
  cart.each_with_object({}) do |items, new_cart|
    items.each do |item, hash|
      new_cart[item] ||= hash # conditional assignment
      new_cart[item][:count] ? new_cart[item][:count] += 1 : new_cart[item][:count] = 1
    end
  end
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item = coupon[:item]
    if cart[item] && cart[item][:count] >= coupon[:num]
      if cart["#{item} W/COUPON"]
        cart["#{item} W/COUPON"][:count] += 1
      else
        cart["#{item} W/COUPON"] = {
          price: coupon[:cost],
          clearance: cart[item][:clearance],
          count: 1,
        }
      end
      cart[item][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end

