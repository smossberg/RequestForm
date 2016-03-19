class UploadsController < ApplicationController
	protect_from_forgery with: :null_session
	respond_to  :js ,:html,:xhr

	def index 
		@heading = Heading.find(params[:heading_id]) #Fånga tillhörande heading
		@uploads = @heading.uploads
		@upload = @heading.uploads.new
		@disable_nav = true

	end
	def show
		@heading = Heading.find(params[:heading_id]) #Fånga tillhörande heading
		@upload = Upload.find(params[:id])
	end
	def new
		@heading = Heading.find(params[:heading_id]) #Fånga tillhörande heading
		@upload = @heading.uploads.new
	end

	def create
		@heading = Heading.find(params[:heading_id]) #Fånga tillhörande heading
		@upload = @heading.uploads.create(upload_params)
		@uploads = @heading.uploads.all
		
		respond_to do |format|
			if @upload.save
				format.js {render 'create'}	
			else
				#format.js {render 'new' } 	
			end
		end
	end
	
	def destroy
		@heading = Heading.find(params[:heading_id]) #Fånga tillhörande heading
		@upload = Upload.find(params[:id])
		@upload_id = @upload.id #Behövs för att kunna ta bort den från viewn
		respond_to do |format|
		    	if @upload.destroy
				format.js { render 'destroy' }
			end
		end	
	end
	
	private
		def upload_params
			params.require(:upload).permit!
		end
		def heading_params
			params.require(:heading).permit!
		end
end
