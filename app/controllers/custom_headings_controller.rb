class CustomHeadingsController < ApplicationController

	@disable_nav = true
	def show
		@custom_heading = CustomHeading.find(params[:id])
		@disable_nav = true
	end
	def new
		#context är den model/class som ska få en custom heading, dvs business context eller annat som har has_many :ch_type i sina modeller
		#/requests/X/business_context ex.
		@context = context
		@custom_heading = @context.custom_headings.new
	end

	def create 
		@context = context
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
		@context = context
		@custom_heading = @context.custom_headings.find(params[:id])

		if @custom_heading.update_attributes(custom_heading_params)
			redirect_to context_url(context)
		end
	end

	private
		#Hämta de skickade parametrarna
		def custom_heading_params
			params.require(:custom_heading).permit!
		end
	
		def context
			#if params[:business_context_id]
			#	id = params[:business_context_id]
			#	BusinessContext.find(params[:business_context_id])
			#end
			find_context
		end
		
		def context_url(context)
			if BusinessContext === context
				business_context_path(context)
			end
		end
		def find_context
			@klass = params[:ch_context_type].capitalize.constantize
			@context = klass.find(params[:ch_context_id])
		end
		
		
end
