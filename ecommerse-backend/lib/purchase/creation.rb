# module Purchase::Creation
# 	PURCHASE_NUMBER_PREFIX = "611"
# 	def self.included(base)
# 		base.extend         ClassMethods
# 		base.send :include, InstanceMethods
# 	end

# 	module ClassMethods
# 		def create_purchase(options)
# 			purchase = Purchase.new
# 			purchase.customer_id=options[:customer_id]
# 			purchase.save!
# 			purchase
# 		end
# 	end
	
# 	module InstanceMethods
# 		def generate_purchase_number
# 			record = true
# 			while record
# 				random = "#{PURCHASE_NUMBER_PREFIX}#{Array.new(6){rand(10)}.join}"
# 				record = Purchase.where(number: random).count > 0 ? true : false
# 			end
# 			self.number = random
# 		end
# 	end

# end