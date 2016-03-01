class HeadingsController < ApplicationController

	@disable_nav = true
	#before_action :all_headings, only: [:index, :create, :update, :destroy]
	#before_action :set_headings, only: [:edit, :update, :destroy]
	respond_to :html, :js
	protect_from_forgery with: :null_session
	
	def show
		@heading = Heading.find(params[:id])
		@heading_attachments = @heading.heading_attachments.all
		@disable_nav = true
	end

	def new
		@headerable= find_headerable
		@heading = @headerable.headings.new
		@heading_attachment = @heading.heading_attachments.build
#		@heading = Heading.new
	
	end

	def create 
		@headerable = find_headerable
		@heading = @headerable.headings.create(heading_params)
		
		# returnera alla headings till viewn
		#
		@headings = @headerable.headings.all
		if @heading.save
			params[:heading_attachments]['attachment'].each do |a|
				@heading_attachment = @heading.heading_attachments.create!(:attachment => a, :heading_id => @heading.id)
			end
		end
		#	redirect_to context_url(context)
		#end
	end
	
	def edit
		@heading = Heading.find(params[:id])
		@disable_nav = true
	end

	def update
		#@context = find_context
		@heading = Heading.find(params[:id])
		@headerable = @heading.headerable
		if @heading.update_attributes(heading_params)
		end
	end
	
	def destroy
		heading = Heading.find(params[:id])
		@heading_id = heading.id
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
