class UploadsController < ApplicationController
	protect_from_forgery with: :null_session
	respond_to :html, :js 

	def index 
		@heading = Heading.find(params[:heading_id]) #Fånga tillhörande heading
		@uploads = @heading.uploads
		@upload = @heading.uploads.new
		@disable_nav = true

	end
	def show
		@upload = Upload.find(params[:id])
	end
	def new
		@heading = Heading.find(params[:heading_id]) #Fånga tillhörande heading
		@upload = @heading.uploads.new
	end

	def create
		@heading = Heading.find(params[:heading_id]) #Fånga tillhörande heading
		@upload = @heading.uploads.create(upload_params)
		
		respond_to do |format|
			if @upload.save
				format.js { render 'create' }
			#	format.json {render json: {message: "success", :status => 200}	
			else
				format.js {render 'new'}
			end
		end
	end
	
	def destroy
		@upload = Upload.find(params[:id])
		@upload_id = @upload.id #Behövs för att kunna ta bort den från viewn
		respond_to do |format|
		    	if @upload.destroy
				format.js { render 'destroy' }
			end
		end	
	      #render json: { message: "File deleted from server" }
	    #else
	      #render json: { message: @upload.errors.full_messages.join(',') }
	    
	end
	
	private
		def upload_params
			params.require(:upload).permit!
		end
		def heading_params
			params.require(:heading).permit!
		end
end
