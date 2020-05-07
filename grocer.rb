require "pry"

def consolidate_cart(cart)
  cart_hash = {}
  cart.each do |hash|
    if cart_hash.key?(hash.keys[0])
      cart_hash[hash.keys[0]][:count] += 1
    else
      hash.each do |key, value|
        value[:count] = 1
        cart_hash[key] = value
      end
    end
  end
  cart_hash
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon_item|
    name = coupon_item[:item]
    if cart.key?(name) && coupon_item[:num] <= cart[name][:count]
      coup_name = name + " W/COUPON"
      cart[name][:count] -= coupon_item[:num]
      if cart.key?(coup_name)
        cart[coup_name][:count] += 1
      else
        cart[coup_name] = {}
        cart[coup_name][:price] = coupon_item[:cost]
        cart[coup_name][:count] = 1
        cart[coup_name][:clearance] = cart[name][:clearance]
      end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |key, _value|
    if cart[key][:clearance]
      cart[key][:price] *= 0.8
      cart[key][:price] = cart[key][:price].round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  # code here
  total = 0
  consolidate = consolidate_cart(cart)
  cart_with_coupons = apply_coupons(consolidate, coupons)
  clearance_cart = apply_clearance(cart_with_coupons)
  clearance_cart.each do |_key, value|
    total += value[:price] * value[:count]
  end
  total > 100.0 ? total *= 0.9 : total
end
