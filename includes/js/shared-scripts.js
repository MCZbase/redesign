$(function () {
            $("#popDialog").dialog({
                autoOpen: false,
                width: 650,
                height: 600,
            });
            $(_btnToDialog).click(function () {
                $("#popDialog").dialog("open");
            });
        });
  

$(document).on("click", "button.popperbtn", function() {
    $("#popDialog").dialog("open");
});
