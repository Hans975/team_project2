$(document).ready(function(){

  const swiper = new Swiper('.sliderimgbox', {
    loop: true,
    speed: 3500,
    spaceBetween: 20,

    breakpoints: {
      220: {
        slidesPerView: 2,
      },
      768: {
        slidesPerView: 4,
      },
    },

    autoplay: {
      delay: 0,
      disableOnInteraction: false,
    },
  });
  
  const sliderswiper = new Swiper('.sliderswiper', {
    loop: true,
    slidesPerView: 3,
    centeredSlides: true,
    spaceBetween: 30,

    pagination: {
      el: ".controler-pagination",
      type: "fraction",
    },

    navigation: {
      nextEl: '.button-next',
      prevEl: '.button-prev',
    },
    breakpoints: {
      280: {
        slidesPerView: 1,
      },
      769: {
        slidesPerView: 3,
      },
    },
  });

  const news = new Swiper('.newsswiper', {
    loop: true,
    spaceBetween: 50,
    // autoplay: {
    //   delay: 1500,
    //   disableOnInteraction:false,
    // },

    pagination: {
      el: '.newsSwiper-pagination',
      clickable: true,
    },
    
    breakpoints: {
      280: {
        slidesPerView: 1,
      },
      769: {
        slidesPerView: 3,
      },
    }
  });

  const pglinkswiper = new Swiper('.pglinkswiper', {
    spaceBetween: 20,
    
    breakpoints: {
      280: {
        slidesPerView: 4,
      },
      769: {
        slidesPerView: 7,
      },
    },

    pagination: {
      el: '.pglink-pagination',
      clickable: true,
    },
  });

  const content3_swiper = new Swiper('.content3_swiper', {
    spaceBetween: 20,
    
    breakpoints: {
      280: {
        slidesPerView: 1,
      },
      769: {
        slidesPerView: 4,
      },
    },

    pagination: {
      el: '.content3-pagination',
      clickable: true,
    },
  });

  function classon(cs){
    if($(cs).hasClass(`on`) == false){
      $(cs).addClass(`on`)
    }
    else{
        $(cs).removeClass(`on`)
    }
  }
    
  $(`.btnMoMenu`).click(function(){
    classon(`.gnb`)
    classon(`.btnMoMenu`)
  })

  $(`.gnbli>li`).click(function(){
    if($(this).hasClass(`on`) == true){
      $(this).css(`height`,`50px`)
      $(this).removeClass(`on`)
    } 
    else{
      let li2depth = $(this).children(`ul`).children().length
      $(`.gnbli>li`).css(`height`,`50px`)
      $(`.gnbli>li`).removeClass(`on`)
      $(this).css(`height`,(li2depth+1)*45+`px`)
      $(this).addClass(`on`)
    }
  })
  $(`.gnbli>li`).click(function(e){
    e.preventDefault()
  })

  $(`.gnbli>li>ul`).click(function(){
    return false;
  })


  $(`.ftul>li`).click(function(){
    if($(this).hasClass(`on`) == true){
      $(this).css(`height`,`40px`)
      $(this).removeClass(`on`)
    } 
    else{
      let li2depth = $(this).children(`ul`).children().length
      console.log(li2depth)
      $(`.ftul>li`).css(`height`,`40px`)
      $(`.ftul>li`).removeClass(`on`)
      $(this).css(`height`,(li2depth+1)*40+`px`)
      $(this).addClass(`on`)
    }

  })

  $(`.ftul>li>a`).click(function(e){
    e.preventDefault()
  })
  $(`.ftul>li>ul`).click(function(){
    return false;
  })


  $(window).scroll(function(){
    let winst = $(window).scrollTop() //스크롤바가 위에서 얼만큼 내려왔는지 계산
    let winHeight = $(window).height()*0.6 //브라우저화면의 높이를 계산        

    $(`.mltr,.mrtl,.mttb,.mbtt`).each(function(){
        if(winst+winHeight > $(this).offset().top){
            $(this).addClass(`on`)
        }else{
            $(this).removeClass(`on`)
        }
    })
  })


  
  $(function () {
    var didScroll;
    var lastScrollTop = 0;
    var delta = 5; // 이벤트를 발생시킬 스크롤의 이동 범위
    var navbarHeight = $(".pc").outerHeight();

    $(window).scroll(function(event){
        didScroll = true;
    });

    setInterval(function() {
        if (didScroll) {
            hasScrolled();
            didScroll = false;
        }
    }, 250); // 스크롤이 멈춘 후 동작이 실행되기 까지의 딜레이

    function hasScrolled() {
        var st = $(this).scrollTop(); // 현재 window의 scrollTop 값

        // delta로 설정한 값보다 많이 스크롤 되어야 실행된다.
        if(Math.abs(lastScrollTop - st) <= delta)
            return;

        if (st > lastScrollTop && st > navbarHeight){
            // 스크롤을 내렸을 때
            $(".pc").addClass(`on`);
             // header 숨기기
        } else {
            // 스크롤을 올렸을 때
            if(st + $(window).height() < $(document).height()) {
              $(".pc").removeClass(`on`); // header 보이기
            }
        }

        lastScrollTop = st; // 현재 멈춘 위치를 기준점으로 재설정
    }
})





















  // $(window).scroll(function(){
  //   let wtop = $(window).scrollTop()
  //   let htop = $(`header.pc`).offset().top

  //   if(wtop >= htop){
      
  //     $(`header.pc`).removeClass(`on`)
  //   }
  //   else{
  //     $(`header.pc`).addClass(`on`)
  //   }
  // })



  // let winHeight = $(window).height()
  // let posFirstTop = $(".value_box").offset().top
  // let boxValHeight = $(".value_box").height()
  // let style1 = {"position":"fixed","left": 0,"top": winHeight-boxValHeight-30,"z-index": 1000}
  // let style2 = {"position":"relative","left":"auto","top":"auto","z-index":0}
  // let scrollPlusToPadding = 0;
  
  // $(window).scroll(function(){
  //   let winst = $(window).scrollTop() //스크롤바가 위에서 얼만큼 내려왔는지 계산
  //   let winHeight = $(window).height()-boxValHeight //브라우저화면의 높이를 계산 
    
  //   if(winst+winHeight>=posFirstTop+30 && winst+winHeight <= 5019){
  //     scrollPlusToPadding = winst - boxValHeight
  //     $(".value_box").css(style1)
  //     $(".s2banner").css("padding-top",4000)
  //     $(".s2banner").css("padding-bottom",619)
  //     if(winst+winHeight >= 1150 && winst+winHeight <= 1300){ 
  //       $(`.value_list>li`).removeClass(`on`)
  //       $(`.bgimg>div`).eq(3).css(`opacity`,1)
  //     }else if(winst+winHeight >= 1301 && winst+winHeight <= 2200){ 
  //       $(`.bgimg>div`).css(`opacity`,0)
  //       $(`.value_list>li`).removeClass(`on`)
  //       $(`.value_list>li`).eq(0).addClass(`on`)
  //       $(`.bgimg>div`).eq(3).css(`opacity`,1)
  //       $(`.bgimg>div`).eq(0).css(`opacity`,1)
  //     }else if(winst+winHeight >= 2201 && winst+winHeight <= 3100){
  //       $(`.bgimg>div`).css(`opacity`,0)
  //       $(`.value_list>li`).removeClass(`on`)
  //       $(`.value_list>li`).eq(1).addClass(`on`)
  //       $(`.bgimg>div`).eq(3).css(`opacity`,1)
  //       $(`.bgimg>div`).eq(1).css(`opacity`,1)
  //     }else if(winst+winHeight >= 3101 && winst+winHeight <= 4000){
  //       $(`.bgimg>div`).css(`opacity`,0)
  //       $(`.value_list>li`).removeClass(`on`)
  //       $(`.value_list>li`).eq(2).addClass(`on`)
  //       $(`.bgimg>div`).eq(3).css(`opacity`,1)
  //       $(`.bgimg>div`).eq(2).css(`opacity`,1)
  //     }else if(winst+winHeight >= 4001 && winst+winHeight <= 4300){
  //       $(`.value_list>li`).removeClass(`on`)
  //       $(`.bgimg>div`).eq(3).css(`opacity`,1)
  //     }
  //   }else if(winst < posFirstTop){
  //     $(".s2banner").css("padding-top",0)
  //     $(".s2banner").css("padding-bottom",4000)
  //     $(".value_box").css(style2)
  //   }else{
  //     $(".value_box").css(style2)
  //     $(".s2banner").css("padding-bottom",0)
  //   }
  // })


  // let scLHeight = $(".inscrollimgL").height()
  // let scLTop = $(".inscrollimgL").offset().top
  // let style22 = {"position":"relative","left":"auto","top":"auto","z-index":0}
  // $(window).scroll(function(){
  //   let wHeight = $(window).height()
  //   let wWidth = $(window).width()
  //   let style11 = {"position":"fixed","left": wWidth/10,"top": scLHeight,"z-index": 1000}
  //   // console.log(wWidth)
  //   let wst = $(window).scrollTop()
  //   // console.log($(`.imglink`).offset().top)
  //   if(wst+50 >= scLTop && wst <= 2000){
  //     $(".inscrollimgL").css(style11)
  //   }else{
  //     $(".inscrollimgL").css(style22)
  //     $(`.scrollimgL`).css("padding-top",1000)
  //   }
  // })


})