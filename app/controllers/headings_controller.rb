class HeadingsController < ApplicationController

	@disable_nav = true
	before_action :all_headings, only: [:index, :create, :update, :destroy]
#	before_action :set_headings, only: [:edit, :update, :destroy]
	respond_to :html, :js
	
	def show
		@heading = Heading.find(params[:id])
		@disable_nav = true
	end
	# Behövs ingen new! Det sköts från de andra controllersen som Heading tillhör
	# Sker i ex business_context#update
	def new
		@context = find_headerable
		@heading = @context.headings.new
#		@heading = Heading.new
	
	end

	def create 
		@context = find_headerable
		@heading = @context.headings.create(heading_params)
		
		#if @heading.save
		#	redirect_to context_url(context)
		#end
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
			params.require(:heading).permit!
		end
		
		#MAGIC
		#hittar vilken model det är
		#ex. /requests/13/  business_context   /  5
		#			context_type	context_id
		def find_context
			@klass = params[:headerable_type].capitalize.constantize
			@context = klass.find(params[:headerable_id])
		end
		def find_headerable
		    params.each do |name, value|
		      if name =~ /(.+)_id$/
			return $1.classify.constantize.find(value) 
		      end
		     end
		    nil 
		end		
		
		def all_headings
			find_headerable.headings.all
		end
		def set_headings 
			@heading = Headings.find(params[:heading_id])
		end
end
