Rails.application.routes.draw do
	namespace :ecommerse do
		namespace :api do
			resources :purchases, only: [] do
				# collection do
				# 	get :account
				# end
				collection do
					post :add_to_cart
				end
			end
			resources :catalogs, only: [:index]
		end
	end
end
