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
    num = coupon[:num]
    cost = coupon[:cost]
    
    if cart.has_key? coupon_item
      cart[coupon_item + " W/COUPON"] = {:price => cost, :clearance => true, :count => 1}
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
