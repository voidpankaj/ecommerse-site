class Ecommerse::Api::StoreOwnersController < ApplicationController
	before_action :load_owner, :except => [:index]

	def fetch_quotation_requests
		render :json=> {:success=>true, :data => {:quotes => @owner.get_quotes_details}}
	end

	private

	def load_owner
		@owner||= StoreOwner.where(:id => params[:owner_id]).last
		raise "not found" if @owner.blank?
	end
	
end
