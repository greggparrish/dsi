//= require jquery3
//= require jquery_ujs

$(document).on('click',function(e) {
  if(  $(e.target).attr('class') != 'navbar'  ) {
    $('#containerNavbar').removeClass('show');
  }
});
