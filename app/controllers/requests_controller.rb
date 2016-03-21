class RequestsController < ApplicationController
	respond_to :html , :js
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
		@request = Request.new(request_create_params)
		
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
	
	#För att kunna addera existerande actors till requesten, istället för att skapa en identisk
	def add_actors_to_request 
		@request = Request.find(params[:id])
		actor_ids = params[:request][:actor_ids] 
		logger.info "actor ids: #{actor_ids}"
		actor_ids = actor_ids.reject  { |c| c.empty? }
		actors = Actor.where(id: actor_ids)
		if @request.actors << actors
			render :js => "window.location = '#{request_actors_path(@request)}'" 
		end
	end
	def remove_actor_from_request
		@request = Request.find(params[:request_id])
		actor_id = params[:id]
		if @request.actors.delete(Actor.find(actor_id))
			render :js => "window.location = '#{request_actors_path(@request)}'" 
		end
	end
	
	private 
		def request_create_params 
			params.require(:request).permit(:name, :description, :creation_date, :owner, :business_context)
		end
		def request_params 
			params.require(:request).permit(:name, :description, :creation_date, :owner, :business_context, :actors, :actor_ids, :actor_ids[])
		end

end
