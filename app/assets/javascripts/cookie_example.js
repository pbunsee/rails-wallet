//When the user submits their name, set a cookie with that value
//Then, when they revisit the page, display their name in
//the greeting div

$(document).ready(function() {

  if (Cookies.get('name')) {
    var name = Cookies.get('name');
    $('#greeting').html(name);
  }

  $('#cookie-name').on('submit', function() {
    var name = $('#cookie-name input[name=name]').val()
    Cookies.set('name', name);
  });

});

