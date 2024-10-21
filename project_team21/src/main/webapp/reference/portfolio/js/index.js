$(document).ready(function(){
    // mousemove cursor-----------------------------------------------
    $(document).mousemove(function(event){
        let x = event.clientX
        let y = event.clientY

        $(`.curTxt`).css(`left`,`${x+10}px`)
        $(`.curTxt`).css(`top`,`${y+15}px`)

        $(`.cursorSub`).css(`top`,`${y+23}px`)
        $(`.cursorSub`).css(`left`,`${x+80}px`)
    })
    $(`.bannertrain`).mouseover(function(){
        $(`.curTxt`).addClass(`on`)
        $(`.cursorSubBox`).addClass(`on`)
    })
    $(`.bannertrain`).mouseout(function(){
        $(`.curTxt`).removeClass(`on`)
        $(`.cursorSubBox`).removeClass(`on`)
    })


    // mouse Scroll event-------------------------------------------
    $(`.container>div`).on(`wheel DOMMouseScroll`,function(event){
        // console.log(event)
        let E = event.originalEvent
        let delta = 0;
        if(E.detail){ // event.originalEvent안에.detail가 있으면 참 없으면 거짓
            delta = E.detail*-40
            // 파이어폭스는 detail
        }else{
            delta = E.wheelDelta
            // 크롬은 wheelDelta
        }
        if($(`.redesignpopup`).hasClass("on") == true){
            return
        }
        if(delta<0){
            //마우스휠을 내렸을 때
            if($(this).next().length!=0){
                let posTop = $(this).next().offset().top
                $(`html,body`).stop().animate({scrollTop:posTop},1000)
            }
        }
        else{
            //마우스휠을 올렸을 때
            if($(this).prev().length!=0){
                let posTop = $(this).prev().offset().top
                $(`html,body`).stop().animate({scrollTop:posTop},1000)
            }
        }
        return false
    })

    // popupSlid----------------------------------------------
    const popupstation = new Swiper('.popupstation', {
        slidesPerView: 3,
        spaceBetween: 70,
        pagination: {
            el:".popuptrain-pagination",
            type:"progressbar",
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });

    // bannerSlid----------------------------------------------
    const bannerstation = new Swiper('.bannerstation', {
        slidesPerView: 1,
        // spaceBetween: 10,
        loop: true,
        pagination: {
            el: ".bannerstation-pagination",
            type: "progressbar",
        },
    });

    // intro------------------------------------------------------
    textAni(`.introtxt>h2`,{
        textSize:250,
        aniSpeed:0.3,
        effect:`introAni`,
        aniDelay:0.2,
    })

    // textAni(`.introtxtBt`,{
    //     textSize: 30,
    //     aniSpeed:0.2,
    //     effect:`introAni`,
    //     aniDelay:0.1,
    // })
    // about-----------------------------------------------------------
    let abouttop = $(`.abouttop`).offset().top
    $(window).scroll(function(){
        let wtop = $(window).scrollTop()
        let wheight = $(window).height()/2
        if(wtop >= abouttop){
            if($(`.skillList`).hasClass(`on`)==false){
                //스킬클래스에 on클래스가 없다면 실행
                $(`.skillList`).addClass(`on`)
                $(`.skillList>li`).each(function(){
                    let list = $(this)
                    let percent = $(this).find(`.per`).text()
                    let count = 0
    
                    let timer = setInterval(function(){
                        count++
                        list.find(`.per`).text(count+`%`)

                        if(count>=percent){
                            clearInterval(timer)
                        }
                    },40);
                })
            }
        }
        if(wtop+wheight >= abouttop){
                $(`.aboutbg`).addClass(`on`)
        }
    })

    // popup------------------------------------------------
    $(`.popuptrain>li`).click(function(e){
        e.preventDefault()
        $(`.popuplayout`).addClass(`on`)
        let count = ($(this).index())
        $(`.popuplayoutdl>dt`).removeClass(`on`)
        $(`.popuplayoutdl>dt`).eq(count).addClass(`on`)
    })
    $(`.pclose`).click(function(e){
        e.preventDefault()
        $(`.popuplayout`).removeClass(`on`)
    })
    $(`.popuplayoutdl>dt`).click(function(e){
        e.preventDefault()
        $(`.popuplayoutdl>dt`).removeClass(`on`)
        $(this).addClass(`on`)
    })

    // banner----------------------------------------------------
    $(`.bannerlayoutul>li`).click(function(e){
        e.preventDefault()
        $(`.bannerstation`).addClass(`on`)
        let count2 = $(this).index()
        bannerstation.slideToLoop(count2, 500)
    })
    $(`.bclose`).click(function(e){
        e.preventDefault()
        $(`.bannerstation`).removeClass(`on`)
    })

    
    // redesign-----------------------------------------------
    $(`.reG`).click(function(e){
        e.preventDefault()
        $(`.redesignpopup`).addClass(`on`)
    })
    $(`.reclose`).click(function(e){
        e.preventDefault()
        $(`.redesignpopup`).removeClass(`on`)
    })

})