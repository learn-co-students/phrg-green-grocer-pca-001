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
    original_count = cart[name][:count]
    cart[name][:count] -= coupon_item[:num]
    new_name = name +  " W/COUPON"
    cart[new_name] = {}
    #binding.pry
    cart[new_name][:price] = coupon_item[:cost]
    cart[new_name][:num] = original_count - coupon_item[:num]
    # binding.pry
  end
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
