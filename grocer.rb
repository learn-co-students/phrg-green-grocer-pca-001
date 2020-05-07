require "pry"
def consolidate_cart(cart)
  cart.each_with_object({}) do |item, result|
    key = item.keys.first
    attributes = item[key]

    # pull item info from existing results
    result_for_current_item = result[key]
    if result_for_current_item
      current_count = result_for_current_item[:count]
    else
      current_count = 0
    end
# save it to results
    attributes[:count] = current_count + 1
    result[key] = attributes
  end
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    coupon_item = coupon[:item]
    coupon_num = coupon[:num]
    cost = coupon[:cost]

    # item in the cart that matches coupon
    cart_item = cart[coupon_item]
    cart_item_count = cart_item[:count] if cart_item

    if (cart.key? coupon_item) && (coupon_num <= cart_item_count)
      # update original item count in cart
      cart_item[:count] = cart_item_count - coupon_num

      # see if coupon item exists already
      coupon_item_key = coupon_item + " W/COUPON"
      cart_coupon_item = cart[coupon_item_key] || { price: cost, :clearance => cart_item[:clearance], :count => 0}

      cart_coupon_item[:count] += 1
      cart[coupon_item_key] = cart_coupon_item
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |item, attributes| 

    if attributes[:clearance] == true
      attributes[:price] = (attributes[:price] * 0.8).round(2)
    end
  end   
end

def checkout(cart, coupons)
  cart = consolidate_cart(cart)
  apply_coupons(cart, coupons)
  apply_clearance(cart)
  total = 0.0

  cart.each do |item, attributes|
    total = (attributes[:price] * attributes[:count]) + total
  end
  if total > 100
    total * 0.9
  else
    total
  end
end