def find_item_by_name_in_collection(name, collection)
  index = 0 
  while index < collection.length do 
    if collection[index][:item] == name 
      return collection[index]
    end
    index +=1 
  end
  nil 
end


def consolidate_cart(cart)
  new_array = []
  index = 0 
  while index < cart.length do 
    current_item = cart[index]
<<<<<<< HEAD
    if current_item[:count] == nil
      current_item[:count] = 1
    end
=======
    current_item[:count] = 1 
>>>>>>> 01082a23503878bd7ee9e1e2fe44bbb90673090f
    if new_array.include?(current_item)
      current_item[:count] += 1 
    else 
      new_array.push(current_item)
    end
    index += 1 
  end
  new_array
end

def apply_coupons(cart, coupons)
  coupon_index = 0 
  while coupon_index < coupons.length do 
    current_coupon = coupons[coupon_index]
    cart_index = 0 
    while cart_index < cart.length do
      current_item = cart[cart_index]
<<<<<<< HEAD
      if current_item[:item] == current_coupon[:item] && current_item[:count] >= current_coupon[:num]
=======
      if current_item[:item] == current_coupon[:item]
>>>>>>> 01082a23503878bd7ee9e1e2fe44bbb90673090f
        applied_coupon = {
          item: "#{current_item[:item]} W/COUPON",
          price: current_coupon[:cost] / current_coupon[:num],
          clearance: current_item[:clearance],
<<<<<<< HEAD
          count: current_coupon[:num]
        }
        current_item[:count] -= applied_coupon[:count]
=======
        }
        if current_item[:count] >= current_coupon[:num]
          applied_coupon[:count] = current_coupon[:num]
          current_item[:count] -= applied_coupon[:count]
        else
          applied_coupon[:count] = current_coupon[:num]
          current_item[:count] = 0
        end
>>>>>>> 01082a23503878bd7ee9e1e2fe44bbb90673090f
        cart.push(applied_coupon)
      end
      cart_index += 1
    end
    coupon_index += 1 
  end
  cart 
end


def apply_clearance(cart)
  index = 0 
  while index < cart.length do 
    if cart[index][:clearance] == true
      price = cart[index][:price]
      cart[index][:price] -= (price * 0.2).round(2)
    end
    index += 1
  end
  cart
end

def checkout(cart, coupons)
<<<<<<< HEAD
  consolidated_cart = consolidate_cart(cart)
  consolidated_cart = apply_coupons(consolidated_cart, coupons)
  consolidated_cart = apply_clearance(consolidated_cart)
  total = 0 
  index = 0 
  while index < consolidated_cart.length do 
    current_price = consolidated_cart[index][:price] * consolidated_cart[index][:count]
=======
  puts "cart #{cart}"
  puts "coupons #{coupons}"
  consolidated_cart = consolidate_cart(cart)
  consolidated_cart = apply_coupons(consolidated_cart, coupons)
  consolidated_cart = apply_clearance(consolidated_cart)
  puts "#{consolidated_cart}"
  total = 0 
  index = 0 
  while index < consolidated_cart.length do 
    current_price = consolidated_cart[index][:price]
>>>>>>> 01082a23503878bd7ee9e1e2fe44bbb90673090f
    total += current_price
    index += 1 
  end
  if total > 100 
    total -= (total * 0.1).round(2)
  end
  total 
end
