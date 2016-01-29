//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require retina/retina
//= require jquery-easing/jquery.easing.min
//= require classie/classie
//= require cbpAnimatedHeader/cbpAnimatedHeader
//= require owl-carousel/owl.carousel
//= require jquery.magnific-popup/jquery.magnific-popup.min
//= require background/core
//= require background/transition
//= require background/background
//= require jquery-mixitup/jquery.mixitup
//= require wow/wow.min
//= require sweet-alert
//= require sweet-alert-confirm
//= require vitality/vitality

$(document).ready(function(e){
    "use strict";

    // force load
    window.scrollTo(0, 1);
    window.scrollTo(0, 0);

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
