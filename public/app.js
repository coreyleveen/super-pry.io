$(function() {
  console.log("App.js is here");

  $("#target").submit(function(event) {
    event.preventDefault();
    alert("Handler for .submit() called");
    var text = $(".input").val();
    $(".input").val("");
    console.log(text);
  });

});


