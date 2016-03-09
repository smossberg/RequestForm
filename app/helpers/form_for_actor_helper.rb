module FormForActorHelper
	def form_for_actor(condition, &block)
	    if condition
		form_for :actor, :url => request_actors_path, html: {class: 'form-horizontal'}, remote: true, :locals => {:request => @request} ,&block
	    else
		form_for :actor,actor_path, :html => {class: "form form-horizontal"}, remote: true, &block
	    end
	end
end

