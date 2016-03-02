class ApplicationLandscapesController < ApplicationController
	respond_to :html, :js

	def show
		@request = Request.find(params[:request_id])
		@alc = @request.application_landscape
		@headings = @alc.headings.all
	end

	def edit
		@request = Request.find(params[:request_id])
		@alc = @request.application_landscape
	end

	def update
		@request = Request.find(params[:request_id])
		@alc = @request.application_landscape
		if @request.application_landscape.update(application_landscape_params)
			redirect_to request_application_landscape_path(@request)
		else
			render 'edit'
		end
	end

	private
	#5.6 getting started @ guides.rubyonrails.org
		def application_landscape_params
			params.require(:business_context).permit(:description, headings_attributes: [:id, :title, :text, :_destroy])
		end
end
