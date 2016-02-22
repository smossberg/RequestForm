class RequestsController < ApplicationController
	def index
		@requests = Request.all
	end
	def show
		@request = Request.find(params[:id])
	end
	def new
		@request = Request.new
	end
	def edit
		@request = Request.find(params[:id])
	end 
	def create
		@request = Request.new(request_params)
		@request.business_context = BusinessContext.new
		@request.business_context.description = "Autogenererad description"
		if @request.save
			redirect_to @request
		else
			render 'new'
		end
	end
	def update
		@request = Request.find(params[:id])

		if @request.update(request_params)
			redirect_to @request
		else 
			render 'edit'
		end
	end
	def destroy
		request = Request.find(params[:id])
		request.destroy

		redirect_to action: "index"
	end
	
	private 
		def request_params 
			params.require(:request).permit(:name, :description, :creation_date, :company, :owner, :business_context)
		end

end
