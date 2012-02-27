class AddProductPriceToLineItems < ActiveRecord::Migration
  def up
    add_column :line_items, :product_price, :decimal

	# pull product price into new line item field
	LineItem.all.each do |line_item|
		line_item.product_price = line_item.product.price
		line_item.save
	end

  end
  
  def down
  	remove_column :line_items, :product_price
  end
end
