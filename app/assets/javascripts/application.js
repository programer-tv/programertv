//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require sweet-alert
//= require sweet-alert-confirm
//= require bootstrap-filestyle/bootstrap-filestyle.min
//= require ckeditor/init
//= require pace/pace.min
//= require breakpoints/breakpoints.min
//= require jquery-unveil/jquery.unveil.min
//= require jquery-block-ui/jqueryblockui.min
//= require jquery-scrollbar/jquery.scrollbar.min
//= require jquery-numberAnimate/jquery.animateNumbers.min
//= require webarch/core
//= require webarch/chat

$(document).ready(function() {
    "use strict";

    // Force load
    window.scrollTo(0, 1);
    window.scrollTo(0, 0);

    $("#layout-condensed-toggle").click(function(e) {
        e.preventDefault();
    });

    // Show flash messages
    if($(".flash-message").length) {
        var key = $(".flash-message").attr("key");
        var value = $(".flash-message").attr("value");
        showFlashMessage(key, value);
    }

    // Bootstrap Filestyle
	$(":file").filestyle({
		// input: false,
		buttonBefore: true,
		buttonText: "&nbsp;File Upload",
		buttonName: "btn btn-success btn-cons",
		iconName: "glyphicon-cloud-upload",
	});
});

// Destroy CKEditor element before unloading page
$(document).on("beforeunload", function() {
	if(typeof(CKEDITOR) != "undefined"){
		for(name in CKEDITOR.instances){
			CKEDITOR.instances[name].destroy();
		}
	}
});

function showFlashMessage(key, value) {
    if(key === "success") {
        swal({
            title: value,
            type: "success",
            allowOutsideClick: true,
            confirmButtonColor: "#0090D9",
        });
    }
    else {
        if(key === "error" || key === "notice") {
            swal({
                title: value,
                type: "error",
                allowOutsideClick: true,
                confirmButtonColor: "#0090D9",
            });
        }
    }
}

//= require turbolinks
