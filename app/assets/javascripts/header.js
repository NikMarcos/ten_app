$(document).on("turbolinks:load",function(){
  $(document).ready(function () {

    $('.link1').click(() => {
        $(".acc_menu").toggle();
      });

    $('.gumb').click((event) => {
      $('.menu').toggleClass('display');
      $(".acc_menu").hide();
    })
  });
});
