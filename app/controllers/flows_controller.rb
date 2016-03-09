class FlowsController < ApplicationController
	before_action :get_request
	respond_to :html, :js
  def index
	@flows = @request.flows.all
  end
  
  def show
	@flow = @request.flows.find(params[:id])
  end

  def new
	@flow = @request.flows.new
  end

  def create
	#@flow.provider = Actor.find(flow_params.require(:provider))
	@flow = @request.flows.create(flow_params)
  end


  def edit
	@flow = @request.flows.find(params[:id])
  end

  def update
	@flow = @request.flows.find(params[:id])
	@flow.update(flow_params)
  end

  def destroy
	@flow = @request.flows.find(params[:id])
	@flow.delete
  end
	private 
	def flow_params
		params.require(:flow).permit(:name, :objective, :size, :provider, :consumer_ids)
	end
	def get_request
		@request = Request.find(params[:request_id])
	end
end
