# encoding: utf-8
class BrokerproductrelsController < ApplicationController
  before_filter :authenticate
  
  def create
    @product = Product.find(params[:brokerproductrel][:product_id])
    Broker.find_by_user_id(current_user.id).favor!(@product)
    respond_to do |format|
       format.html { redirect_to @product }
       format.js
     end
  end
  
  def destroy
    @product = Brokerproductrel.find(params[:id]).product
    Broker.find_by_user_id(current_user.id).unfavor!(@product)
    respond_to do |format|
      format.html { redirect_to @product }
      format.js
    end
  end
end
