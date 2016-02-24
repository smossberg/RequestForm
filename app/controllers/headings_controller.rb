class HeadingsController < ApplicationController

	@disable_nav = true
	def show
		@heading = Heading.find(params[:id])
		@disable_nav = true
	end
	# Behövs ingen new! Det sköts från de andra controllersen som Heading tillhör
	# Sker i ex business_context#update
	def new
		@context = find_context
		@heading = @context.headings.new
	end

	def create 
		@context = find_context
		@heading = @context.headings.new(heading_params)
		
		if @heading.save
			redirect_to context_url(context)
		end
	end
	
	def edit
		@heading = Heading.find(params[:id])
		@disable_nav = true
	end

	def update
		@context = find_context
		@heading = @context.headings.find(params[:id])

		if @heading.update_attributes(heading_params)
			redirect_to context_url(context)
		end
	end
	
	def destroy
		heading = Heading.find(params[:id])
		heading.destroy
	end

	private
		#Hämta de skickade parametrarna
		def heading_params
			params.require(:headerable).permit!
		end
		
		#MAGIC
		#hittar vilken model det är
		#ex. /requests/13/  business_context   /  5
		#			context_type	context_id
		def find_context
			@klass = params[:headerable_type].capitalize.constantize
			@context = klass.find(params[:headerable_id])
		end
		
		
end
