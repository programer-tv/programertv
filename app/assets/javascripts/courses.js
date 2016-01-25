//= require masonry/masonry.min

$(window).on("load", function() {
    $(".courses").masonry({
        itemSelector: ".course",
        fitWidth: true,
        gutter: 30,
        originLeft: false,
    });
});
