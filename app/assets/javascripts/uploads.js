$(document).ready(function(){
	Dropzone.autoDiscover = false;

	$("#new_upload").dropzone({
		paramName: "upload[attachment]",
		addRemoveLinks: true
	});
});

