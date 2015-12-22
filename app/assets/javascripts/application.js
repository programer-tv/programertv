//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require sweet-alert
//= require sweet-alert-confirm
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

    $("#layout-condensed-toggle").click(function(e) {
        e.preventDefault();
    });

    // show flash messages
    if($(".flash-message").length) {
        var key = $(".flash-message").attr("key");
        var value = $(".flash-message").attr("value");
        showFlashMessage(key, value);
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
