require 'pry'

def consolidate_cart(cart)

  new_cart = {}

  cart.each do |items, count|
    items.each do |item, hash|
      new_cart[item] ||= hash
        new_cart[item][:count] ? new_cart[item][:count] += 1 : new_cart[item][:count] = 1
    end
  end
new_cart
end


def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
