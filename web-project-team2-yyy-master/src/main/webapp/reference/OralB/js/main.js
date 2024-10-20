$(document).ready(function(){
    let windowWidth = $(window).width()
    let moveTargetTop = $(".movTarget").offset().top
    
    let scrState;

    function getStateView(){
        let result;
        if($(window).width()>=768){
            result = true
        }else{
            result = false
        }
        return result
    }

    scrState = getStateView()
    $(window).resize(function(){
        scrState = getStateView()
        console.log(scrState)
        if(scrState == false){
            $(".movTarget").css("top",0)
        }
    })
    

    $(window).scroll(function(){
        let winst=$(window).scrollTop()
        if(scrState==true){
            scrollMove(winst,moveTargetTop)
        }
    })
    
    function scrollMove(scroll,targetTop){
        let scrollimg = $(".scrollimg")
        let target = $(".movTarget")
        let scrollimgTop = scrollimg.offset().top
        let scrollHeight = scrollimg.height()
        let moveTargetHeight = target.height()
        let distance = targetTop-scrollimgTop
        
        if(scroll>=targetTop && scroll<scrollimgTop+scrollHeight-moveTargetHeight){
            // console.log("작동중이고 스크롤증가량은: "+(winst-moveTargetTop))
            target.css("top",(distance+(scroll-targetTop))+"px")
        }
    }
    


})