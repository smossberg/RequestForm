class OwnersController < ApplicationController
	respond_to :html, :js
	def new
		@request = Request.find(params[:request_id])
		@owner = Owner.new
		@disable_nav = true
	end

	def create
		@owner = Owner.create(owner_params)
		if @owner.save 
			render 'create'
		else
			render 'new'
		end
	end
	def add_ownership_of(ownerable_type, ownerable_id)
		@owner = Owner.find(params[:id])
		@context = find_context
		
	end
	private 
		def owner_params
			params.require(:owner).permit!
		end
		def find_context
			@klass = params[:ownerable_type].capitalize.constantize
			@context = klass.find(params[:ownerable_id])
		end

end
