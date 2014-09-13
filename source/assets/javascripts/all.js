//= require_tree .
//= require jquery
//= require bootstrap
//= require ekko-lightbox/dist/ekko-lightbox

$(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
  event.preventDefault();
  $(this).ekkoLightbox();
});

$(document).on('ready', function(event) {
  $('[data-toggle=tooltip]').tooltip();
  if (typeof(ga) !== 'undefined' && $(window).scrollTop() === 0) {
    tracker_setup();
  }
});

function tracker_setup() {
  navbar = $('[data-measure=navbar]');
  content_area = $('[data-measure=content-area]');
  if (navbar.length && content_area.length) {
    navbar_height = navbar.outerHeight(true);
    content_area_height = content_area.height();
    halfway_mark = (content_area_height) / 2;
    $(window).scroll(halfway_detect);
  }
}

function halfway_detect() {
  var window_scroll_pos = $(window).scrollTop();
  if (window_scroll_pos + navbar_height >= halfway_mark) {
    ga('send', 'event', 'halfway mark', 'read');
    $(window).unbind('scroll');
  }
}
