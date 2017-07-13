//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('click',function(e) {
  if(  $(e.target).attr('class') != 'navbar'  ) {
    $('#containerNavbar').removeClass('show');
  }
});
