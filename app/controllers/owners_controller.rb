class OwnersController < ApplicationController
	respond_to :html, :js
	def new
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
	private 
		def owner_params
			params.require(:owner).permit!
		end

end
