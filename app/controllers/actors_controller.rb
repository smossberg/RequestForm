class ActorsController < ApplicationController

  def index
	@actors = Actor.all
	@disable_nav = true
  end

  def show
	@actor = Actor.find(params[:id])
	@disable_nav = true
  end

  def new
	@actor = Actor.new
	@disable_nav = true
  end

  def create
	@actor = Actor.create(actor_params)
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
