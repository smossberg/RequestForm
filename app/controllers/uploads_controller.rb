class UploadsController < ApplicationController
  def new
	@upload = Upload.new
	@disable_nav = true
  end

	def create

		@upload = Upload.create(upload_params)
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
			params.require(:upload).permit(:attachment)
		end
end
