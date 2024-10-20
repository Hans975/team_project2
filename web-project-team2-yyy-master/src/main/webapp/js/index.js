$(document).ready(function(){
  
      // 주소 검색 버튼 클릭 시 카카오 주소 검색 API 호출
      $('#search-btn').on('click', function() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 기본 주소 설정
                var fullAddress = data.address;  // 도로명 주소나 지번 주소

                // 추가 주소 처리 (법정동, 건물명)
                var extraAddress = '';  // 참고 항목 주소
                if (data.addressType === 'R') { // 도로명 주소인 경우
                    if (data.bname !== '' || data.buildingName !== '') {
                        extraAddress = (data.bname !== '' ? data.bname : '') + 
                                       (data.buildingName !== '' ? ', ' + data.buildingName : '');
                        fullAddress += (extraAddress !== '' ? ' ('+ extraAddress +')' : '');
                    }
                }

                // 선택된 주소를 input 필드에 반영
                $('#address').val(fullAddress);

                // 선택된 주소를 화면에 표시
                $('#address-result').html('선택한 주소: ' + fullAddress);
            }
        }).open();
    });


  const mainSwiperContainer = new Swiper(".mainSwiperContainer", {
    spaceBetween: 30,
    centeredSlides: true,
    loop: true,
    autoplay: {
      delay: 2500,
      disableOnInteraction: false,
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  let prodDetailOptionList1height = $(`.prodDetailOptionList1`).height()
  $(".prodDetailOptionSize").css("top",prodDetailOptionList1height + 40 +`px`)

  let prodDetailOptionList2Box = $(`.prodDetailOptionList2Box`).height()
  let prodDetailOptionList1 = $(`.prodDetailOptionList1`).height()
  let prodDetailOptionListBox = prodDetailOptionList2Box+prodDetailOptionList1
  $(".prodDetailOption").css("height",prodDetailOptionListBox + 90 +`px`)
    const newSwiperListBox = new Swiper(".newSwiperListBox", {
      slidesPerView: 4,
      spaceBetween: 20,
      loop: true,
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
        
      },
    });

  const swiper = new Swiper(".prodDetailTitleimgSweper", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
    });

    const reviewsImgListinBox = new Swiper(".reviewsImgListinBox", {
      slidesPerView: 8,
      spaceBetween: 30,
      loop: true,
      navigation: {
        
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
        
      },
    });

// .prodDetailOptionList1Li 클릭 시
$('.prodDetailOptionList1Li').click(function() {
  // 형제 태그에서 on 클래스 제거
  $(this).siblings().removeClass('on');
  $(this).siblings().find('.prodDetailOptionList2Box').removeClass('on');
  $(this).siblings().find('.prodDetailOptionList2Li').removeClass('on');
  
  // 현재 클릭된 li와 자식 태그들에 on 클래스 토글
  $(this).toggleClass('on');
  $(this).find('.prodDetailOptionList2Box').toggleClass('on');

  // 만약 .prodDetailOptionList1Li에서 on이 제거되면 자식 태그인 .prodDetailOptionList2Li에서도 on 제거
  if (!$(this).hasClass('on')) {
      $(this).find('.prodDetailOptionList2Li').removeClass('on');
  }

  // .prodDetailSelectOption에 on 클래스 업데이트
  updateSelectOptionClass();
});

// .prodDetailOptionList2Li 클릭 시
$('.prodDetailOptionList2Li').click(function(event) {
  // 상위 요소로의 이벤트 전파 중단
  event.stopPropagation();

  // 형제 태그에서 on 클래스 제거
  $(this).siblings().removeClass('on');
  
  // 현재 클릭된 .prodDetailOptionList2Li에 on 클래스 토글
  $(this).toggleClass('on');

  // .prodDetailSelectOption에 on 클래스 업데이트
  updateSelectOptionClass();
});

// .prodDetailSelectOption에 on 클래스 추가/제거하는 함수
function updateSelectOptionClass() {
  // .prodDetailOptionList1Li와 그 자식 태그인 .prodDetailOptionList2Li에 on이 모두 있는지 확인
  var isAllOn = $('.prodDetailOptionList1Li.on').length > 0 &&
                $('.prodDetailOptionList1Li .prodDetailOptionList2Li.on').length > 0;

  // 선택된 .prodDetailOptionList1Li와 .prodDetailOptionList2Li의 span 태그 값을 가져옴
  var option1Text = $('.prodDetailOptionList1Li.on span').first().text();
  var option2Text = $('.prodDetailOptionList1Li.on .prodDetailOptionList2Li.on span').first().text();

  // 조건에 따라 .prodDetailSelectOption에 on 클래스 추가/제거 및 선택된 옵션 텍스트 업데이트
  if (isAllOn) {
      $('.prodDetailSelectOption').addClass('on');
      // 선택된 옵션 텍스트를 .SelectOptions에 업데이트
      $('.SelectOptions').text(option1Text +'/'+ option2Text);
  } else {
      $('.prodDetailSelectOption').removeClass('on');
      // 선택 취소 시 .SelectOptions 텍스트 초기화
      $('.SelectOptions').text('');
  }
}

  $(`.up`).click(function() {
      let currentValue = parseInt($('#SelectQty').val()); // 현재 값
      $('#SelectQty').val(currentValue + 1); // 1 증가
  });

  $('.down').click(function() {
    let currentValue = parseInt($('#SelectQty').val()); // 현재 값
    if(currentValue > 1) { // 값이 1보다 클 때만 감소
        $('#SelectQty').val(currentValue - 1); // 1 감소
    }
  });
  $(`.prodDetailDetailimg_more>a`).click(function(){
    $(this).addClass(`on`)
    $(`.prodDetailDetailimgBox`).addClass(`on`)
})



})
