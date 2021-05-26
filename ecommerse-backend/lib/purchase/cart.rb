# module Purchase::Cart
# 	def self.included(receiver)
# 		receiver.extend         ClassMethods
# 		receiver.send :include, InstanceMethods
# 	end
	
# 	module ClassMethods
		
# 	end
	
# 	module InstanceMethods
# 		def add_cart_items(params)
# 			params[:cart_data][:items].each do |item_param|
# 				oi = self.order_items.where(catalog_id: item_param[:catalog_id]).last
# 				oi ||= OrderItem.create_item(self, item_param[:quantity], item_param[:catalog_id])
# 				oi.quantity = item_param[:quantity]
# 				oi.save
# 			end
# 		end
# 	end
# end