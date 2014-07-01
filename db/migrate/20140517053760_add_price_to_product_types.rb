class AddPriceToProductTypes < ActiveRecord::Migration
  def change
    add_column :product_types, :price, :float, :default=>0
  end
end


