//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require sweet-alert
//= require sweet-alert-confirm
//= require bootstrap-filestyle/bootstrap-filestyle.min
//= require ckeditor/init
//= require ckeditor/config
//= require highlight/highlight.pack
//= require pace/pace.min
//= require breakpoints/breakpoints.min
//= require jquery-unveil/jquery.unveil.min
//= require jquery-block-ui/jqueryblockui.min
//= require jquery-scrollbar/jquery.scrollbar.min
//= require jquery-numberAnimate/jquery.animateNumbers.min
//= require masonry/masonry.min
//= require webarch/core
//= require webarch/chat

$(document).ready(function() {
    "use strict";

    // Force load
    window.scrollTo(0, 1);
    window.scrollTo(0, 0);

    // Load highlight.js
    hljs.initHighlightingOnLoad();

    // Remove facebook callback weird characters
    if (window.location.hash.search('#_') >= 0)
        window.location.hash = "";

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
		buttonText: "&nbsp;تحميل ملف",
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

// masonry boxes
$(window).on("load", function() {
    $(".boxes").masonry({
        itemSelector: ".box",
        fitWidth: true,
        gutter: 25,
        originLeft: false,
    });
});

function showFlashMessage(key, value) {
    if(key === "success") {
        swal({
            title: value,
            type: "success",
            allowOutsideClick: true,
            confirmButtonColor: "#0090D9",
            confirmButtonText: "تم",
        });
    }
    else {
        if(key === "error") {
            swal({
                title: value,
                type: "error",
                allowOutsideClick: true,
                confirmButtonColor: "#0090D9",
                confirmButtonText: "تم",
            });
        }
        else {
            if(key === "notice") {
                swal({
                    title: value,
                    type: "info",
                    allowOutsideClick: true,
                    confirmButtonColor: "#0090D9",
                    confirmButtonText: "تم",
                });
            }
            else {
                if(key === "alert") {
                    swal({
                        title: value,
                        type: "warning",
                        allowOutsideClick: true,
                        confirmButtonColor: "#0090D9",
                        confirmButtonText: "تم",
                    });
                }
            }
        }
    }
}

//= require turbolinks
