class CreateProductDescriptions < ActiveRecord::Migration
  def change
    create_table :product_descriptions do |t|
      t.string :property_title
      t.text :description_silver_kit
      t.text :description_gold_kit
      t.integer :country_id

      t.timestamps
    end
  end
end
