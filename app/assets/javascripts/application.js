// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery_nested_form
//= require activestorage
//= require_tree

document.addEventListener('DOMContentLoaded', function () {
  document.getElementById('image-file').addEventListener("change", function (evt) {
    var file = evt.target.files;
    var reader = new FileReader();
    reader.readAsDataURL(file[0]);
    reader.onload = function () {
      document.querySelector('#img_prev').src = reader.result;
    }
  }, false);

  document.getElementById('article_gears_attributes_0_gear_image').addEventListener("change", function (evt) {
    var file = evt.target.files;
    var reader = new FileReader();
    reader.readAsDataURL(file[0]);
    reader.onload = function () {
      document.querySelector('#preview').src = reader.result;
    }
  }, false);

});

$(document).on('nested:fieldAdded', function (event) {
  var field = event.field;
  var addField = field.find('.add_nested_fields');
  addField.click();
});

$(function() {

  function setImagePreview() {
    const targets = document.getElementsByClassName('image_preview')
    for (let i = 0; i < targets.length; i++) {
      targets[i].addEventListener("change", function(evt) {
        var file = evt.target.files;
        var reader = new FileReader();
        reader.readAsDataURL(file[0]);
        reader.onload = function () {
          var preview_list = document.querySelectorAll('.gear_image')
          preview_list[i].src = reader.result;
        }
      }, false);
    }
  }

  $(document).on('nested:fieldAdded', function (event) {
      setImagePreview();
  });
  
});