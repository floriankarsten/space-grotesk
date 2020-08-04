var charPreview = $('#character-preview > div.character-content > div.character');
var charName = $('#character-info > span.name');
var charUnicode = $('#character-info > span.unicode');

$( ".character-list > div > div > span" ).hover(
  function() {
  	var charContent = $(this).text();
  	var charNameData = $(this).data('name');
  	var charUnicodeData = $(this).data('unicode');
  	$(this).addClass('active').siblings().removeClass('active').parent().parent().siblings().children().children().removeClass('active');
  	charPreview.text(charContent);
  	charName.text(charNameData);
  	charUnicode.text(charUnicodeData);
  }, function() {}
);

$( ".weights .switch-container > div" ).hover(
  function() {
  	var weight = $(this).data('weight');
  	$(this).addClass('active').siblings().removeClass('active');
  	$(this).parent().siblings('.text').css('font-weight', weight);
  	console.log(weight);
  }, function() {}
);

$( ".opentype .switch-container > div" ).hover(
  function() {
    var features = $(this).data('features');
    $(this).addClass('active').siblings().removeClass('active');

    if(features == 'off') {
      $('.opentype > .text > span').addClass('disabled');
    } else {
      $('.opentype > .text > span').removeClass('disabled');
    }
  }, function() {}
);

$( ".transition .switch-container > div" ).hover(
  function() {
    var features = $(this).data('features');
    $(this).addClass('active').siblings().removeClass('active');

    if(features == 'off') {
      $('.transition > .text').addClass('disabled');
    } else {
      $('.transition > .text').removeClass('disabled');
    }
  }, function() {}
);