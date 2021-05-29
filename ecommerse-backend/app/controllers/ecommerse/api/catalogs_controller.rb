class Ecommerse::Api::CatalogsController < ApplicationController

	def index
		page = params[:page] || 1
		per_page = params[:per_page] || 10
		@catalogs = Catalog.paginate(:page => page, :per_page =>per_page)
		data = @catalogs.map do |catalog|
			{
				:title => catalog.title,
				:price => catalog.price,
				:catalog_id => catalog.id
			}
		end
		render :json=> {:success=>true, :products => data} and return
	end
	# render json: { errors: @post.errors.full_messages.join(', ') }, status: :unprocessable_entity

end
