$(function() {
  var docHeight = $(document).height();

  $('#target').submit(function(event) {
    event.preventDefault();
    sendText(docHeight);
    $('.input').val("");
    return false;
  });

  // Clear screen with Ctrl + L
  // Should be fixed to just add space below equal to viewport height
  $(document).keydown(function(e){
    if (e.keyCode == 76 && e.ctrlKey) {
      $("p").remove();
    }
  });
});

function sendText(h) {
  var text = $('.input').val();

  $.ajax({
    url: "/",
    method: 'post',
    data: {code: text},
    success: function(data) {
      handleInput(data, text);
      expandPage(h);
    }
  });
}

function expandPage(originalDocHeight) {
  var mainHeight = $('.main').height();

   if (mainHeight > originalDocHeight) {
    var newStyles = {
      "position": "relative",
      "padding-top": "1em"
    };

    $('.main').css(newStyles);
   }
  // Scroll down
  $('html, body').animate({scrollTop: $(document).height()}, 'fast');
}

function handleInput(data, text) {
  // Handle multiple lines
  if (data == "*") {
    var output = $("<p></p>").text(">> * " + text).addClass("output");
    $('.main').append(output);
  } else {
    var output = $("<p></p>").text(">> " + text).addClass("output");
    var response = $("<p></p>").text(data);
    $('.main').append(output);
    $('.main').append(response);
  }

}
