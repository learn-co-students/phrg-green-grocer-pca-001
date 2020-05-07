
require 'pry'
def consolidate_cart(cart)
  consolidated_cart = {}
  cart.each do |item|
    product = item.keys.first
    value = item[product]

    if consolidated_cart[product]
      consolidated_cart[product][:count] += 1

    else
      consolidated_cart[product] = value
      value[:count] = 1
    end
  end
  consolidated_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item = coupon[:item]
    if cart[item] && cart[item][:count] >= coupon[:num]
      cart[item][:count] -= coupon[:num]
      if cart["#{item} W/COUPON"].nil?
        cart["#{item} W/COUPON"] = {
          price: coupon[:cost],
          clearance: cart[item][:clearance],
          count: 1,
        }
      else
        cart["#{item} W/COUPON"][:count] += 1
      end
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


