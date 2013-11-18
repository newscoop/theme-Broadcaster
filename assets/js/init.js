$(document).ready(function() {

  /* Input focus/blur */

  $('input[type="text"], input[type="password"], textarea').focus(function() {
    if(this.value==this.defaultValue)this.value='';
  });

  $('input[type="text"], input[type="password"], textarea').blur(function() {
    if (this.value ==='')this.value=this.defaultValue;
  });

  // User list slider
  // $('.slider').jcarousel({
  //  visble: 1,
  //  scroll: 1
  // });

  if( $(window).width() < 660) {

    var expandCounter = 0;
    $('.top-menu ul li a').click(function(){
      if (expandCounter === 0) {
        $(this).addClass('active');
        $(this).next('.sub').slideDown('fast');
        expandCounter = 1;
      } else if ($(this).hasClass('active')) {
        $('.top-menu ul li a').removeClass('active');
        $('.sub').slideUp('fast');
        expandCounter = 0;
      } else {
        $('.top-menu ul li a').removeClass('active');
        $('.sub').slideUp('fast');
        $(this).addClass('active');
        $(this).next('.sub').slideDown('fast');
        expandCounter = 1;
      }
      return false;
    });

    $('a.cat-trigger').click(function(){
      $('.top-menu ul li a').removeClass('active');
      $('.top-menu ul li .sub').slideUp();
      $(this).next('ul').slideToggle('fast');
      expandCounter = 0;
    });

    $('.search-box a.search-trigger').click(function(){
      $('.top-menu ul li a').removeClass('active');
      $('.top-menu ul li .sub').slideUp();
      $(this).toggleClass('active');
      $(this).next('div').slideToggle('fast');
      expandCounter = 0;
    });

  } else {

    // Man Nav
    $('.top-menu ul li').hover(function(){
      $(this).children('a').addClass('active');
      $(this).children('.sub').slideDown('fast');
    },
    function(){
      $(this).children('a').removeClass('active');
      $(this).children('.sub').slideUp('fast');
    });
  }

  // Article Details
  $('article').hover(function(){
    $(this).find('.info').slideDown('fast');
  },
  function(){
    $(this).find('.info').slideUp('fast');
  });

  // bxSlider
  if ($('.bxslider article')[0]){
    $('.bxslider').bxSlider({
      auto: true
    });
  }

  // add class to comment buttons
  $('.comments').find('input[type=submit]').each(function(){
    $(this).addClass('button');
  });

  // album review links opener
  $('.social_links').find('a').bind('click', function(){
    // console.log($(this).attr('href'));
    var $link = $(this).attr('href');
    window.open($link);
    return false;
  });

  // share links opener and parent slideUp
  $('.share').find('a').bind('click', function(){
    // console.log($(this).attr('href'));
    var $link = $(this).attr('href');
    window.open($link);
    $(this).parent().parent().slideUp('fast');
    return false;
  });

  // programgrid
  $("#headerLiveHolder").airtimeLiveInfo({
      sourceDomain: apiSrc,
      text: {onAirNow:"On Air Now", offline:"Offline", current:"Current", next:"Next"},
      updatePeriod: 20 //seconds
  });

  $("#headerLiveTrackHolder").airtimeLiveTrackInfo({
      sourceDomain: apiSrc,
      text: {onAirNow:"On Air Now", offline:"Offline", current:"Current", next:"Next"},
      updatePeriod: 20 //seconds
  });

  $("#onAirToday").airtimeShowSchedule({
      sourceDomain: apiSrc,
      text: {onAirToday:"On air today"},
      updatePeriod: 5, //seconds
      showLimit: 10
  });

  // active state gubbins for the program grid 
  if ($('.program_grid')[0]){

    setTimeout(function(){
      var day = 'monday';
      $("#scheduleTabs .tab_container div").each(function(){
        if (!$(this).hasClass(day)){
          $(this).hide();
        }
      });
      $("#scheduleTabs .tabs a").bind('click',function() {
        $("#scheduleTabs .tabs li").removeClass('active');
        day = $(this).parent().parent().attr('class');
        day = day.toLowerCase();
        $(this).parent().parent().addClass('active');
        $("#scheduleTabs .tab_container div").each(function(){
          $(this).animate({
            opacity: 0
          }, function(){
              $("#scheduleTabs .tab_container div").hide();
            });
          if ($(this).hasClass(day)) {
            setTimeout(function(){
              $("#scheduleTabs .tab_container ." + day).show();
              $("#scheduleTabs .tab_container ." + day).animate({
                opacity: 1
              });
            }, 1000);
          }
        });
        return false;
      });
    }, 1000);


    $("#scheduleTabs").airtimeWeekSchedule({
      sourceDomain: apiSrc,
      dowText:{monday:"Monday", tuesday:"Tuesday", wednesday:"Wednesday", thursday:"Thursday", friday:"Friday", saturday:"Saturday", sunday:"Sunday"},
      miscText:{time:"Time", programName:"Program Name", details:"Details", readMore:"Read More"},
      updatePeriod: 600 //seconds
    });
    var d = new Date().getDay();
    // $('#scheduleTabs').tabs({selected: d === 0 ? 6 : d-1, fx: { opacity: 'toggle' }});
  }

  // open sponsors in new window
  $('.sponsors').find('a').bind('click', function(){
    window.open($(this).attr('href'));
    return false;
  });

  // hide most of the menu when in mobile view
  // console.log($(window).width());
  if ($(window).width() <= 400 ){
    $('#nav-bar li a').each(function(){
      // console.log($(this).text());
      if ($(this).text() != 'Home' &&
          $(this).text() != 'Programs' &&
          $(this).text() != 'Program Grid' &&
          $(this).text() != 'Shows' &&
          $(this).text() != 'Events'){
            $(this).parent().hide();
      }
    });
  }

});