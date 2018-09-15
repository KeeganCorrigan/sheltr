
$(document).ready(function() {
//   $('a[href=#top]').click(function() {
//       $('html,body').animate({scrollTop: 500}, 'slow');
//       return false;
//   });
// });

  $("a[href^='#']").click(function(e) {
  	e.preventDefault();

  	var position = $($(this).attr("href")).offset().top;

  	$("body, html").animate({
  		scrollTop: position
  	}, 500 );
  });
});
