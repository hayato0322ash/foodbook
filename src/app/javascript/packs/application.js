// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require rails-ujs
//= require activestorage
//= require turbolinks 

//= require jquery
//= require popper
//= require bootstrap
//= require_tree .

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
//以下の一文を追加
require("jquery")

//以下の一文を追加
require('hayato.js')

$(function () {
  setTimeout("$('.alert').fadeOut('slow')", 2000);
});