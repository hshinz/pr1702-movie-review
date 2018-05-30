$(document).on("turbolinks:load", function() {
  $("#add_comment").on("click", function() {
    $("movie-comment").prepend("....")
  });
});
