class RequestsController < ApplicationController
	def index
		@requests = Request.all
	end
	def new
	end
	def create
		@request = Request.new(request_params)

		@request.save
		redirect_to @request
	#	render plain: params[:request].inspect
	end
	def show
		@request = Request.find(params[:id])
	end
	
	private 
		def request_params 
			params.require(:request).permit(:name, :description, :creation_date, :company, :owner)
		end

end
