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
//= require nested_form_fields
//= require activestorage
//= require_tree

document.addEventListener('DOMContentLoaded', function () {
  document.getElementById('article_photo').addEventListener("change", function (evt) {
    var file = evt.target.files;
    var reader = new FileReader();
    reader.readAsDataURL(file[0]);
    reader.onload = function () {
      document.querySelector('#img_prev').src = reader.result;
    }
  }, false);

  // gearフォームの画像プレビュー（37行目でエラー)
  // function imgPreView(event, targetId) {
  //   var reader = new FileReader();
  //   var file = event.target.files[0];
  //   var preview = document.getElementById(targetId);

  //   reader.onload = function (event) {
  //     // document.querySelector(targetId).src = reader.result;
  //     document.querySelector("#preview" + targetId).src = reader.result;
  //   };

  //   reader.readAsDataURL(event.target.files[0]);
  // }
});