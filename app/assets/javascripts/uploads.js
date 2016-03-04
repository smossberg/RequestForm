$(document).ready(function() {
	Dropzone.autoDiscover = false;
	$(".new-upload").dropzone({
		paramName: "upload[attachment]",
		addRemoveLinks: true,
	
	success: function(file, response) {
		this.removeFile(file);
		$.getScript("/uploads");
	}
	});
});

