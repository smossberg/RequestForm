class BcController < ApplicationController
	def index
	end
	def new
	end
	def create
		@bc = Bc.new(business_context_params)

		@bc.save
		redirect_to @bc 
	end
	def show
		@bc = Bc.find(params[:id])
	end
	private
		def business_context_params
			params.require(:bc).permit(:as_is_imgage, :description, :as_is_description, :to_be_image, :to_be_description)
		end
	
end
