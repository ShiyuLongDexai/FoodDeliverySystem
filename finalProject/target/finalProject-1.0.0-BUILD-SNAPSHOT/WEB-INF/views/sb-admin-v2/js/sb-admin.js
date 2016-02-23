$(function() {

    $('#side-menu').metisMenu();

});

$("#tabs").tabs();

$(".nexttab").click(function() {
    var selected = $("#tabs").tabs("option", "selected");
    $("#tabs").tabs("option", "selected", selected + 1);
});


//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
$(function() {
    $(window).bind("load resize", function() {
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.sidebar-collapse').addClass('collapse')
        } else {
            $('div.sidebar-collapse').removeClass('collapse')
        }
    })
})
