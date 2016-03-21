class OwnersController < ApplicationController
	respond_to :html, :js
	def index
		context = find_ownerable
		@owners = context.owners
		@disable_nav = true
	end
	def new
		@ownerable = find_ownerable
		@owner = @ownerable.build_owner
		@disable_nav = true
		render 'form'
	end

	def create
		@ownerable = find_ownerable
		@owner = @ownerable.owners.create(owner_params)
		if @owner.save 
			render 'create'
		else
			render 'new'
		end
	end
	def add_ownership
		@owner = Owner.find(params[:id])
		ownerable = find_ownerable
		if ownerable.owners << @owner

		end
		
	end
	private 
		def owner_params
			params.require(:owner).permit!
		end
		def find_ownerable
			resource, id = request.path.split('/')[1,2]
			@ownerable = resource.singularize.classify.constantize.find(id)
		end
		def find_ownerable2
		    params.each do |name, value|
		      if name =~ /(.+)_id$/
			return $1.classify.constantize.find(value) 
		      end
		     end
		    nil 
		end		
		def find_context
			@klass = params[:ownerable_type].capitalize.constantize
			@context = klass.find(params[:ownerable_id])
		end

end
