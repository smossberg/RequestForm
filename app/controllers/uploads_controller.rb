class UploadsController < ApplicationController
	protect_from_forgery with: :null_session

	def index 
		@heading = Heading.find(params[:heading_id]) #Fånga tillhörande heading
		@uploads = @heading.uploads.all
		@upload = @heading.uploads.new
		@disable_nav = true

	end
	def new
		@heading = Heading.find(params[:heading_id]) #Fånga tillhörande heading
		@upload = @heading.uploads.build
		@disable_nav = true
	end

	def create
		@heading = Heading.find(params[:heading_id]) #Fånga tillhörande heading
		@upload = @heading.uploads.create(upload_params)
		if @upload.save
			render json: {message: "success"}, :status => 200
		else
			render json: { error: @upload.errors.full_messages.join(',')}, :status => 400
		end
	end
	
	def destroy
	    @upload = Upload.find(params[:id])
	    if @upload.destroy    
	      render json: { message: "File deleted from server" }
	    else
	      render json: { message: @upload.errors.full_messages.join(',') }
	    end
	end
	
	private
		def upload_params
			params.require(:upload).permit!
		end
end
