class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :title
      t.text :body
      t.integer :country_id

      t.timestamps
    end
  end
end
