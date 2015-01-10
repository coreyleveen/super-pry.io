$(function() {
  $('#target').submit(function(event) {
    event.preventDefault();
    sendText();
    $('.input').val("");
    return false;
  });

  $(document).keydown(function(e){
    if (e.keyCode == 76 && e.ctrlKey) {
      $("p").remove();
    }
  });
});

function sendText() {
  var text = $('.input').val();
  $.ajax({
    url: "/",
    method: 'post',
    data: {code: text},
    success: function(data) {
      handleInput(data, text);
      expandPage();
    }
  });
}

function expandPage() {
  var mainHeight = $('.main').height();
  var pageHeight = $(document).height();
  console.log("expand fired");
  if (mainHeight > pageHeight) {
    console.log('inside main');
    $('.expander').css('height', mainHeight+'px');
    $('.main').offset({top: -18, left: 8});
  }
}

function handleInput(data, text) {
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
