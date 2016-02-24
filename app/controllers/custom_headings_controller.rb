class CustomHeadingsController < ApplicationController

	@disable_nav = true
	def show
		@custom_heading = CustomHeading.find(params[:id])
		@disable_nav = true
	end
	# Behövs ingen new! Det sköts från de andra controllersen som CustomHeading tillhör
	# Sker i ex business_context#update
	def new
		@context = find_context
		@custom_heading = @context.custom_headings.new
	end

	def create 
		@context = find_context
		@custom_heading = @context.custom_headings.new(custom_heading_params)
		
		if @custom_heading.save
			redirect_to context_url(context)
		end
	end
	
	def edit
		@custom_heading = CustomHeading.find(params[:id])
		@disable_nav = true
	end

	def update
		@context = find_context
		@custom_heading = @context.custom_headings.find(params[:id])

		if @custom_heading.update_attributes(custom_heading_params)
			redirect_to context_url(context)
		end
	end
	
	def destroy
		custom_heading = CustomHeading.find(params[:id])
		custom_heading.destroy
	end

	private
		#Hämta de skickade parametrarna
		def custom_heading_params
			params.require(:custom_heading).permit!
		end
		
		#MAGIC
		#hittar vilken model det är
		#ex. /requests/13/  business_context   /  5
		#			context_type	context_id
		def find_context
			@klass = params[:ch_context_type].capitalize.constantize
			@context = klass.find(params[:ch_context_id])
		end
		
		
end
