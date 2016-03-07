module FormForActorHelper
	def form_for_actor(condition, &block)
	    if condition
		form_for :actor, :url => request_actors_path, &block
	    else
		form_for :actor,actor_path, :html => {class: "form"}, &block
	    end
	end
end

