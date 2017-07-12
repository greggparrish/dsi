//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('click',function(e) {
  if(  $(e.target).attr('class') != 'navbar'  ) {
    console.log('kkk');
    $('#containerNavbar').removeClass('show');
  }
});
