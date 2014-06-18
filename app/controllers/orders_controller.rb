class OrdersController < ApplicationController
  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def post_back
   @country = Country.find_by_id(cookies[:country_id])
    respond_to do |format|
      format.html
      format.js
    end
  end
end

