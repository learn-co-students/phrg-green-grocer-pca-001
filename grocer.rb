require 'pry'

  def consolidate_cart(cart)
    cart.each_with_object({}) do |items, new_cart|
      items.each do |item, hash|
        new_cart[item] ||= hash
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
    cart.each do |item, price_hash|
      if price_hash[:clearance] == true
        price_hash[:price] = (price_hash[:price] * 0.8).round(2)
      end
    end
    cart
  end

  def checkout(items, coupons)
    cart = consolidate_cart(items)
    cart1 = apply_coupons(cart, coupons)
    cart2 = apply_clearance(cart1)
    total = 0
    cart2.each do |name, price_hash|
      total += price_hash[:price] * price_hash[:count]
    end
    total > 100 ? total * 0.9 : total
  end

#   def items
# {"AVOCADO" => {:price => 3.00, :clearance => true}},
# {"KALE" => {:price => 3.00, :clearance => false}},
# {"BLACK_BEANS" => {:price => 2.50, :clearance => false}},
# {"ALMONDS" => {:price => 9.00, :clearance => false}},
# {"TEMPEH" => {:price => 3.00, :clearance => true}},
# {"CHEESE" => {:price => 6.50, :clearance => false}},
# {"BEER" => {:price => 13.00, :clearance => false}},
# {"PEANUTBUTTER" => {:price => 3.00, :clearance => true}},
# {"BEETS" => {:price => 2.50, :clearance => false}}
# ]
#   end
