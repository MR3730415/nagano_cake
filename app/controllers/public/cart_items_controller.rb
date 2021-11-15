class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

def index
  @cart_items = current_customer.cart_items.all
  @total = @cart_items.inject(0){|sum,item| sum+item.sum_of_price}
end

def create
@cart_item = current_customer.cart_items.build(item_id: params[:item_id])
@cart_item = CartItem.new(cart_item_params)
@cart_item.customer_id = current_customer.id
@cart_item.item_id = params[:item_id]

if @cart_item.save
  flash[:alert] = "個数を選択してください"
  render "public/items/show"
end
end

def update
@cart_item = CartItem.find(params[:id])
#@cart.units += cart_parms[:units].to_i
@cart_item.update(crat_item_params)
redirect_to public_cart_items_path
end

def destoroy
  @cart_item = CartItem.find(params[:id])
  @cart_item.destoroy
  flash[:alert] = "#{@cart_item.item.name}を削除しました"
  redirect_to public_cart_items_path
end

def all_destoroy
  @cart_item = current_customer.cart_items
  @cart_item.destoroy_all
  flash[:alert] = "カートの商品を全て削除しました"
  redirect_to public_cart_items_path
end

private
def cart_item_params
  params.require(:cart_item).permit(:about, :item_id, :customer_id)
end
end
