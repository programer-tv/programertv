//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require sweet-alert
//= require sweet-alert-confirm

$(document).ready(function() {
    "use strict";

    // Show flash messages
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
