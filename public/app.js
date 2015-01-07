$(function() {
  $("#target").submit(function(event) {
    event.preventDefault();
    sendText();
    $(".input").val("");
    return false;
  });

  $(document).keydown(function(e){
    if (e.keyCode == 76 && e.ctrlKey) {
      $("p").remove();
    }
  });
});

function sendText() {
  var text = $(".input").val();

  $.ajax({
    url: "/",
    method: 'post',
    data: {code: text},
    success: function(data) {
      // Handle multi-line input
      if (data == "*") {
        var output = $("<p></p>").text("* " + text).addClass("output");
        $(".title-wrapper").append(output);
      } else {
        var output = $("<p></p>").text(text).addClass("output");
        var response = $("<p></p>").text(data)
        $(".title-wrapper").append(output);
        $(".title-wrapper").append(response)
      }
    }
  });
}
