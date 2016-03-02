
$(document).ready(function() {
	$('.new-upload-link').click(function(){
		
		Dropzone.discover();
	});
	
	Dropzone.autoDiscover = false;
	$("#new_upload").dropzone({
		paramName: "upload[attachment]",
		addRemoveLinks: true
	});
	dropzone.on("success", function(file) {
		this.removeFile(file)
		$.getScript("/uploads")
	})
});

