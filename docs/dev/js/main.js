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

$( ".weight-switch > div" ).hover(
  function() {
  	var weight = $(this).data('weight');
  	$(this).addClass('active').siblings().removeClass('active');
  	$('.intro > .text').css('font-weight', weight);
  	console.log(weight);
  }, function() {}
);