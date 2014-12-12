$(function() {
  console.log("App.js is here");

  $("#target").submit(function(event) {
    alert("Handler for .submit() called");
    event.preventDefault();
  });

});


