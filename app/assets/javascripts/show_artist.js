$(document).ready(function() {
  $('.popup-with-zoom-anim').magnificPopup({
    type: 'inline',
    fixedContentPos: false,
    fixedBgPos: true,
    overflowY: 'auto',
    closeBtnInside: true,
    preloader: false,
    midClick: true,
    removalDelay: 300,
    mainClass: 'my-mfp-zoom-in'
  });
});

$(window).load(function() {  
  $("#flexiselDemo1").flexisel({
    visibleItems: 5,
    animationSpeed: 1000,
    autoPlay: true,
    autoPlaySpeed: 3000,        
    pauseOnHover: false,
    enableResponsiveBreakpoints: true,
    responsiveBreakpoints: { 
      portrait: { 
        changePoint:480,
        visibleItems: 2
      }, 
      landscape: { 
        changePoint:640,
        visibleItems: 3
      },
      tablet: { 
        changePoint:800,
        visibleItems: 4
      }
    }
  });
});
