$(function() {
  $("#target").submit(function(event) {
    event.preventDefault();
    sendText();
    $(".input").val("");
    expandPage();
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
        var output = $("<p></p>").text(">> * " + text).addClass("output");
        $(".main").append(output);
      } else {
        var output = $("<p></p>").text(">> " + text).addClass("output");
        var response = $("<p></p>").text(data)
        $(".main").append(output);
        $(".main").append(response)
      }
    }
  });
}

function expandPage() {
  var mainHeight = $(".main").height();
  var pageHeight = $(document).height();
  alert("mainheight: " + mainHeight);
  alert("pageheight: " + pageHeight);
  if (mainHeight > pageHeight) {
    debugger;
    $('.expander').css('height', mainHeight+'px');
  }
}
