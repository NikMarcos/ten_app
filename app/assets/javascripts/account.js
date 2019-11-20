
$(document).on("turbolinks:load",function(){
  $(document).ready(function () {
    sliderTimer();
    $('li:not(:first)').hide();
    let firstLi = $('.active').first();
    let li = $('li').first();
    let secondLi = li.next();


    function next () {
      let currentSlide = $('.active');
      let nextSlide = currentSlide.next();
      let prevSlide = currentSlide.prev();
      let nextAfterNextSlide = nextSlide.next();
      console.log(currentSlide);

      if(!currentSlide.length) {
        li.toggleClass("toLeft");
        secondLi.removeClass();
        secondLi.toggleClass('active active_right');
        secondLi.show();
      } else {
        currentSlide.removeClass();
        currentSlide.toggleClass("toLeft");



        if(!nextSlide.length) {
          li.removeClass();
          firstLi.toggleClass('active active_right');
        } else {
          nextSlide.show();
          nextSlide.removeClass();
          nextSlide.toggleClass('active active_right');
        }

      }

      $("#prev").attr("disabled", false).css({'opacity':'0.3'});
    }

    function sliderTimer () {
      t = setInterval(next, 5000);
    }

    $('#next').click(function (event) {
      clearInterval(t);
      next();
      sliderTimer();
    })

    $('#prev').click(function (event) {
      clearInterval(t);
      let currentSlide = $('.active');
      let nextSlide = currentSlide.next();
      let prevSlide = currentSlide.prev();
      let prevBeforePrevSlide = prevSlide.prev();

      currentSlide.removeClass();
      if(!prevBeforePrevSlide.length) {
        $("#prev").attr("disabled", true).css({'opacity':'0.3'});
      }
      currentSlide.toggleClass("toRight");
      prevSlide.toggleClass("toLeft");
      prevSlide.toggleClass('active active_left');
      sliderTimer();
      // $("#next").attr("disabled", false).css({'opacity':'0.3'});
    })

  });
});
