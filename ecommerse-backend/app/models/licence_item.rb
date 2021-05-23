class LicenceItem < ApplicationRecord
	belongs_to :lite_licence
	belongs_to :catalog
end
