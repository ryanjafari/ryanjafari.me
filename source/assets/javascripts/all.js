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
});

