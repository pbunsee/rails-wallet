// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require cookies
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function onReady() {
  $('.ajax-test').on('ajax:success', function(e) {
    alert('alert');
    $('body').css('background-color', 'red');
  });

  $('#turbo-test').on('click', function(){
    alert('hey');
  });
}

function doFetchAlert() {
  alert('fetch');
}

function doLoadAlert() {
  alert('load');
}

function doReceiveAlert() {
  alert('receive');
}

function doChangeAlert() {
  alert('change');
}

$(document).on('page:change', onReady);
$(document).on('page:change', doChangeAlert);
$(document).on('page:fetch', doFetchAlert);
$(document).on('page:load', doLoadAlert);
$(document).on('page:receive', doReceiveAlert);
