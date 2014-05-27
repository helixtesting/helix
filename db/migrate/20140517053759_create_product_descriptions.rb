class CreateProductDescriptions < ActiveRecord::Migration
  def change
    create_table :product_descriptions do |t|
      t.string :title
      t.text :body
      t.integer :product_type_id
      t.integer :country_id

      t.timestamps
    end
  end
end
