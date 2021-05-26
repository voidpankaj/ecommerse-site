class StoreOwner < ApplicationRecord
	belongs_to :user
	has_many :catalogs
	has_many :issued_licences, class_name: "LiteLicence"
end
