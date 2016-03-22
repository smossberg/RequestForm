class ActorsController < ApplicationController

	helper :form_for_actor
	respond_to :html, :js
  def index
	if (params.has_key?(:request_id)) 
		@request = Request.find(params[:request_id])
		@actors = @request.actors.all
	else
		@actors = Actor.all
		@disable_nav = true
	end
  end

  def show
	if (params.has_key?(:request_id))
		@request = Request.find(params[:request_id])
		@actor = @request.actors.find(params[:id])
	else 
		@actor = Actor.find(params[:id])
		@disable_nav = true
	end
  end

  def new
	if (params.has_key?(:request_id))
		@request = Request.find(params[:request_id])
		@actor = @request.actors.new
	else	
		@actor = Actor.new
		@disable_nav = true
	end
  end

  def create
	if (params.has_key?(:request_id))
		@request = Request.find(params[:request_id])
		if @request.actors.create(actor_params)
			@actors = @request.actors.all
		end
	else
		if Actor.create(actor_params)
			@actors = Actor.all
		end
	end
#	if @actor.save 
#		if (params.has_key?(:request_id))
#			redirect_to request_actor_path(@request,@actor)
#		else
#			redirect_to @actor
#		end
#	else
#		if (params.has_key?(:request_id))
#			redirect_to new_request_actor_path(@request)
#		else
#			redirect_to 'new'
#		end
#	end
	@disable_nav = true
  end
  
  def edit
	if (params.has_key?(:request_id))
		@request = Request.find(params[:request_id])
	end
	@actor = Actor.find(params[:id])
	@disable_nav = true
  end 
  def update
	if (params.has_key?(:request_id))
		@request = Request.find(params[:request_id])
	end
	@actor = Actor.find(params[:id])
	if @actor.update(actor_params)
	end
	
  end

  def destroy
	actor = Actor.find(params[:id])
	@actor_id = actor.id
	actor.destroy
	
  end


	private
		def actor_params
			params.require(:actor).permit!
		end
	
end
