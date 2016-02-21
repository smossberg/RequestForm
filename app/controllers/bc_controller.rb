class BcController < ApplicationController
	def index
	end
	def new
	end
	def create
		@request = Request.find(params[:request_id])
		@bc = @request.bc.create(business_context_params)

		redirect_to request_path(@request) 
	end
	def show
		@bc = Bc.find(params[:id])
	end
	private
		def business_context_params
			params.require(:bc).permit(:as_is_imgage, :description, :as_is_description, :to_be_image, :to_be_description)
		end
	
end
