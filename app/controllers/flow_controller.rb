class FlowController < ApplicationController
	before_action :get_request
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
	@flow = @request.flows.create(flow_params)
	if @flow.save
		redirect_to request_flows_path(@request)
	else
		redirect_to new_request_flow_path(@request)
	end
  end


  def edit
	@flow = @request.flows.find(params[:id])
  end

  def update
	@flow = @request.flows.find(params[:id])
	if @flow.update(flow_params)
		redirect_to request_flow_path(@flow)
	else
		redirect_to edit_request_flow_path(@flow)
	end
  end

  def destroy
	@flow = @request.flows.find(params[:id])
	if @flow.delete
		redirect_to request_flows_path
	else
	
	end
  end
	private 
	def flow_params
		params.require(:flow).permit!
	end
	def get_request
		@request = Request.find(params[:request_id])
	end
end
