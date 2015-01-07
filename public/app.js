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
  //var input = $("<p></p>").text(text)
  //$(".form-wrapper").append(input)
  $.ajax({
    url: "/",
    method: 'post',
    data: {code: text},
    success: function(data) {
      var response = $("<p></p>").text(data)
      $(".form-wrapper").append(response)
    }
  });
}
