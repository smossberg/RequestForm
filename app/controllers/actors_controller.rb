class ActorsController < ApplicationController

	helper :form_for_actor
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
		@actor = @request.actors.create(actor_params)
	else
		@actor = Actor.create(actor_params)
	end
	if @actor.save 
		redirect_to @actor
	else
		redirect_to 'new'
	end
	@disable_nav = true
  end
  
  def edit
	@actor = Actor.find(oarams[:id])
	@disable_nav = true
  end 
  def update
	@actor = Actor.find(params[:id])
	if @actor.update(actor_params)
		redirect_to 'show'
	else
		redirect_to 'edit'
	end
	
  end

  def destroy
	@actor = Actor.find(params[:id])
	if @actor.destroy
		redirect_to actors_path
	end
  end
	private
		def actor_params
			params.require(:actor).permit!
		end
	
end
