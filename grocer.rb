require "pry"
def consolidate_cart(cart)

  result = {}

  cart.each do |item|

    # pull info from cart
    key = item.keys.first
    attributes = item[item.keys.first]
    # binding.pry

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

  result
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
