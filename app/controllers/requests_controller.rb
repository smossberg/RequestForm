class RequestsController < ApplicationController
	def index
		@requests = Request.all
		@disable_nav = true
	end
	def show
		@request = Request.find(params[:id])
	end
	def new
		@request = Request.new
		@disable_nav = true
	end
	def edit
		@request = Request.find(params[:id])
	end 
	def create
		@request = Request.new(request_params)
		
		if @request.save
			redirect_to @request
			#render 'show'
		else
			@disable_nav = true
			render 'new'
		end
		#Fyll business Context default
		@request.business_context = BusinessContext.create
		@request.business_context.headings.create(:title => "Description", :text => "")
		@request.business_context.headings.create(:title => "As-Is", :text => "")
		@request.business_context.headings.create(:title => "To-Be", :text => "")

		#Skapa Actors 
		@request.actors.build
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
			params.require(:request).permit(:name, :description, :creation_date, :company, :owner, :business_context, :actors)
		end

end
