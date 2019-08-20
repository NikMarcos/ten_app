//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery-ui/widgets/tooltip

$(document).ready(function() {
if (gon.splited_article) {
  $('.sub').hide();
  let html = ``;
  const download_image_block = document.getElementById('download_image_block');
  const common_block = $('#common_block');
  const form_block = document.getElementById('form_block');
  let splitArticle = gon.splited_article.body.split('.');
  for(let i = 0; i < splitArticle.length; i++) {
    html += `<span id="${i}">${splitArticle[i]}.</span>`;
  };
  common_block.html(html);



  let imagesClicks2 = 0;
  let imageClicks = 1;
  $('span').on("click", function(){
    $('.sub').show();
    let imageBlock = $('<span>');
    imageBlock.attr('class', 'imagePoint');
    const textImageBlock = $(document.createTextNode(imageClicks));
    imageBlock.html(`${imageClicks}`);
    $(imageBlock).insertAfter($(`#${this.id}`));
    $(this).toggleClass('clearfix');

    const textDownloadBlock = document.createTextNode("Выберите изображение " + imageClicks + " ");
    // let html = `<br>Выберите изображение ${imageClicks}
    // <input type="file" class="set_image_input" id="this.id" name="image_article[pic[${imagesClicks2}]]">`
    let input1 = document.createElement('input');
    let br = document.createElement('br');
    input1.setAttribute('type', 'file');
    input1.setAttribute('name', `image_article[pic[${imagesClicks2}]]`);
    input1.setAttribute('id', this.id);
    input1.setAttribute('class', "set_image_input");
    $(textDownloadBlock).insertBefore($('.sub'));
    $(input1).insertBefore($('.sub'));
    $(br).insertBefore($('.sub'));
    imageClicks++;
    imagesClicks2++;
  });
}


});
