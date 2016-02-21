class BusinessContextsController < ApplicationController
  def show
	request = Request.find(params[:request_id])
	@bc = request.business_context
  end
	def edit
		@request = Request.find(params[:request_id])
		@bc = @request.business_context
	end
	def update
		@request = Request.find(params[:request_id])
		@bc = @request.business_context
		if @request.business_context.update(business_context_params)
			redirect_to request_business_context_path(@request)
			#render 'edit'
		else
			render 'edit'
		end
		
	end


	private 
		def business_context_params
			params.require(:business_context).permit(:description, :as_is_image, :to_be_image)
			
		end
end
