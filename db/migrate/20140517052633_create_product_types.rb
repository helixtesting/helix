class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :name
      t.text :description
      t.integer :country_id

      t.timestamps
    end
  end
end
