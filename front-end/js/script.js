$(document).ready(function(){
  $(document).scroll(function(){
    var scroll = $(document).scrollTop();
    //console.log('haciedno scroll '+scroll);
    if(scroll>10){
      //$(".menu-main").hide();
      //$(".menu-main").removeClass('mt-3');
      //$(".menu-nav").addClass('bg-nama-azul');
    }else{
      //$(".menu-main").show();
      //$(".menu-main").addClass('animated slideIn mt-3');
      //$(".menu-nav").removeClass('bg-nama-azul');
    }
  });

  var banners=$(".banners [class^='banner-']").length;
  var mostrar=1;
  var bannerSlider;

  $(".btn-slider-left").on("click",function(){
    continueCounting();
    $(".banners [class^='banner-']").removeClass('banner-subir');
    if(mostrar==1){
      mostrar=banners;
    }else{
      mostrar--;
    }
    //console.log("mostrar: "+mostrar);
    $(".banners [class^='banner-']").removeClass("banner-mostrado animated fadeIn");
    $(".banner-0"+mostrar).addClass("banner-mostrado animated fadeIn");
    $(".slider-pagging [class^='slider-']").removeClass("slider-active");
    $(".slider-pagging [class^='slider-']").eq(mostrar-1).addClass('slider-active');
    setTimeout(function(){
      $(".wrap-slider-left").trigger("mouseenter");
    }, 1000);
  });

  function paginacionBanner(){
    var html='';
    for(var i=0; i<banners; i++){
      if(i==0){
        html+='<div class="slider-banner slider-active"></div>';
      }else{
        html+='<div class="slider-banner"></div>';
      }
    }
    $(".slider-pagging").html(html);
  }
  paginacionBanner();

  $(".btn-slider-right").on("click",function(){
    continueCounting();
    $(".banners [class^='banner-']").removeClass('banner-subir');
    if(mostrar==banners){
      mostrar=1;
    }else{
      mostrar++;
    }
    $(".banners [class^='banner-']").removeClass("banner-mostrado animated fadeIn");
    $(".banner-0"+mostrar).addClass("banner-mostrado animated fadeIn");
    $(".slider-pagging [class^='slider-']").removeClass("slider-active");
    $(".slider-pagging [class^='slider-']").eq(mostrar-1).addClass('slider-active');
    setTimeout(function(){
      $(".wrap-slider-right").trigger("mouseenter");
    }, 1000);
  });

  $(".wrap-slider-left").on("mouseenter", function(){
    pausarSlider();
    $(".banners [class^='banner-']").removeClass('banner-subir');
    //console.log("entro i");
    var mostrado=$(".banner-mostrado");
    var clases=mostrado.attr("class").split(' ');
    var clase=clases[0].split('-');
    var banner=parseInt(clase[1]);
    //console.log("banner: "+banner);
    var anterior=0;
    if(banner==1){
      anterior=banners;
    }else{
      anterior=banner-1;
    }
    //console.log("anterior: "+anterior);
    $(".banner-0"+anterior).addClass("banner-subir").show();
    for(var i=1; i<=banners; i++){
      if(i!=banner && i!=anterior){
        $(".banner-0"+i).hide();
      }
    }
  });

  $(".wrap-slider-right").on("mouseenter", function(){
    pausarSlider();
    $(".banners [class^='banner-']").removeClass('banner-subir');
    //console.log("entro i");
    var mostrado=$(".banner-mostrado");
    var clases=mostrado.attr("class").split(' ');
    var clase=clases[0].split('-');
    var banner=parseInt(clase[1]);
    //console.log("banner: "+banner);
    var posterior=0;
    if(banner==banners){
      posterior=1;
    }else{
      posterior=banner+1;
    }
    //console.log("anterior: "+anterior);
    $(".banner-0"+posterior).addClass("banner-subir").show();
    for(var i=1; i<=banners; i++){
      if(i!=banner && i!=posterior){
        $(".banner-0"+i).hide();
      }
    }
  });

  /*$(".slider-banner").on("click",function(){
    $(".banners [class^='banner-']").removeClass('banner-subir');
    var $t = $(this);
    var index = $t.index();
    console.log(index);

    $(".banners [class^='banner-']").removeClass("banner-mostrado");
    $(".banner-0"+(index+1)).addClass("banner-mostrado");

    $(".slider-pagging [class^='slider-']").removeClass("slider-active");
    $t.addClass('slider-active');
  });*/

  $("#enlaceAspectos").on("click", function(){
    var aspectos=$("#aspectos-generales").offset().top;
    var altoMenu=$(".menu-nav").innerHeight();
    var scroll=aspectos-altoMenu;
    $('html, body').animate({scrollTop: scroll},3000);
  });

  $('#accordion').on('shown.bs.collapse', function() {
    /*var h3 = $("[aria-expanded='true']").attr("href");
    var altoMenu=$(".menu-nav").height();
    var enlaces=$(h3).parent().parent().offset().top;
    $('html, body').animate({scrollTop: (enlaces-altoMenu)},'slow');*/
  })

  $('#accordion h3').on('click', function() {
    var h3 = $(this).attr("href");
    var altoMenu=$(".menu-nav").height();
    var enlaces=$(h3).parent().parent().offset().top;
    $('html, body').animate({scrollTop: (enlaces-altoMenu-24)},'slow');
  })
  /*$("#accordion h3").on("click", function(){
    var altoMenu=$(".menu-sub").height();
    var enlaces=$(this).offset().top;
    var scroll02=enlaces-altoMenu;
    console.log("altoMenu: "+altoMenu+", enlaces: "+enlaces+", scroll02: "+scroll02);
    $('html, body').animate({scrollTop: scroll02},'slow');

    var aspectos=$("#aspectos-generales").offset().top;
    var altoMenu=$(".menu-sub").height();
    var scroll01=aspectos-altoMenu;
    $('html, body').animate({scrollTop: scroll01},'slow');
    var enlaces=$(this).offset().top;
    var scroll02=enlaces-altoMenu;
    $('html, body').animate({scrollTop: scroll02},'slow');
  });*/

  function correrSlider(){
    bannerSlider=setInterval(function(){ //alert("cambia");
      $(".wrap-slider-right").trigger("mouseenter");
      $(".btn-slider-right").trigger("click");
    },18000);
  }
  correrSlider();
  function pausarSlider(){
    //clearInterval(bannerSlider);
  }

  function continueCounting(){
    //correrSlider();
  }

  var wow = new WOW({
      boxClass:     'wow',      // animated element css class (default is wow)
      animateClass: 'animated', // animation css class (default is animated)
      offset:       0,          // distance to the element when triggering the animation (default is 0)
      mobile:       true,       // trigger animations on mobile devices (default is true)
      live:         true,       // act on asynchronously loaded content (default is true)
      callback:     function(box) {
        // the callback is fired every time an animation is started
        // the argument that is passed in is the DOM node being animated
      },
      scrollContainer: null // optional scroll container selector, otherwise use window
    });
  wow.init();
});
