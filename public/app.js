$(function() {
  $("#target").submit(function(event) {
    event.preventDefault();
    sendText();
    $(".input").val("");
    return false;
  });
});

function sendText() {
  var text = $(".input").val();
  $.ajax({
    url: "/.json",
    method: 'post',
    data: {code: text},
    success: function(data) {
      var par = $("<p></p>").html(data)
      $(".form-wrapper").append(par)
    }
  });
}
