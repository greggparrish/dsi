// close modal when clicking outside iframe
$(".videoModal").on('hidden.bs.modal', function (e) {
  $(".videoModal iframe").attr("src", $(".videoModal iframe").attr("src"));
});

// populate iframe with YT embed in link
$('.embedLink').click(function() {
  console.log('clicked');
  var videoSrc = $(this).attr("href"); 
  console.log(videoSrc);
  $(".videoModal iframe").attr("src", videoSrc);
});


