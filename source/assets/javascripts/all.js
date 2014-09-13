//= require_tree .
//= require jquery
//= require bootstrap
//= require ekko-lightbox/dist/ekko-lightbox

$(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
  event.preventDefault();
  $(this).ekkoLightbox();
});

var navbar_height;
var content_area_height;
var halfway_mark;

$(document).on('ready', function(event) {
  $('[data-toggle=tooltip]').tooltip();
  navbar_height = $('[data-measure=navbar]').outerHeight(true);
  content_area_height = $('[data-measure=content-area]').height();
  halfway_mark = (content_area_height) / 2;
});

$(window).scroll(function() {
  var window_scroll_pos = $(this).scrollTop();
  if (window_scroll_pos + navbar_height >= halfway_mark) {
    ga('send', 'event', 'halfway mark', 'read');
    $(window).unbind('scroll');
  }
});
