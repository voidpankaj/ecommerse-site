class Customer < ApplicationRecord
	has_one :licence, class_name: "LiteLicence"
	belongs_to :user
end
