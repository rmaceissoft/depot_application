class AddPaymentTypeIdToOrders < ActiveRecord::Migration
  
  def up
  	add_column :orders, :payment_type_id, :integer
  	
  	# pull payment_type_id from payment_types table
  	Order.all.each do |order|
  		payment_type = PaymentType.find_by_name(order.pay_type)
  		order.payment_type_id = payment_type.id
  		order.save  		
  	end
  end
  
  
  def down  	
  	remove_column :order, :payment_type_id
  end
end
