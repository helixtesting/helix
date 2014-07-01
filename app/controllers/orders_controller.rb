class OrdersController < ApplicationController
  def new
    @country = Country.find(params[:country_id]) rescue Country.first
    @product_types = ProductType.where(country_id: @country.id)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def post_back
    @country = Country.find(params[:country_id])
     @product_type = ProductType.find(params[:package])
    respond_to do |format|
      format.html
      format.js
    end
  end
end

