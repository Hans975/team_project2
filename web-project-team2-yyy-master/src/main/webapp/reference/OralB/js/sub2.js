 $(document).ready(function(){
    let windowWidth = $(window).width()
    if(windowWidth>=768){


        let winHeight = $(window).height()
        let content2top = $(`.content2`).offset().top
        // let Producttop = $(`.Product`).offset().top
        // let value_boxheiht = $(`.value_box`).height()
        // let content1heiht = $(`.content1`).height()


        $(window).scroll(function(){
            let winst = $(window).scrollTop() //스크롤바가 위에서 얼만큼 내려왔는지 계산
            let distance = winst-content2top
            let s2bannerheight = $(`.s2banner`).height()
            console.log(4000 - s2bannerheight)
            if(distance<0){
                $(".s2banner").css("position","absolute")
                $(".s2banner").css("left","0")
                $(".s2banner").css("top","0")
            }
            if(distance>=0 && distance <= 4000-s2bannerheight){
                $(".s2banner").css("position","fixed")
                $(".s2banner").css("left","0")
                $(".s2banner").css("top","0")
                if(distance>=0 && distance <= 1000){
                    $(`.bgimg>div`).removeClass(`on`)
                    $(`.bgimgbox1`).addClass(`on`)
                    $(`.value_list>li`).removeClass(`on`)
                    $(`.value_list>li`).eq(0).addClass(`on`)
                }else if(distance>=0 && distance <= 2000){
                    $(`.bgimg>div`).removeClass(`on`)
                    $(`.bgimgbox2`).addClass(`on`)
                    $(`.value_list>li`).removeClass(`on`)
                    $(`.value_list>li`).eq(1).addClass(`on`)
                }else if(distance>=0 && distance <= 3000){
                    $(`.bgimg>div`).removeClass(`on`)
                    $(`.bgimgbox3`).addClass(`on`)
                    $(`.value_list>li`).removeClass(`on`)
                    $(`.value_list>li`).eq(2).addClass(`on`)
                }
            }
            if(distance> 4000-s2bannerheight){
                $(".s2banner").css("position","absolute")
                $(".s2banner").css("left","0")
                $(".s2banner").css("top",(4000-s2bannerheight)+"px")
            }

        })




    }
 })