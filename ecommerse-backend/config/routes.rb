Rails.application.routes.draw do
	namespace :ecommerse do
		namespace :api do
			resources :purchases, only: [] do
				collection do
					post :add_to_cart
					get :fetch_active_cart
					post :update_cart_data
				end
			end
			resources :catalogs, only: [:index]
			resources :customers, only: [:index] do
				collection do
					get :get_licence_items
					get :fetch_quotation_requests
				end
			end
			resources :store_owners, only: [:index] do
				collection do
					get :fetch_quotation_requests
				end
			end
			resources :quotation_requests, only: [] do
				collection do
					post :add_to_qoute_cart
					get :fetch_draft_quote_request
					post :submit_quote_request
					post :update_quote_request
					post :add_comment
				end
			end
		end
	end
end