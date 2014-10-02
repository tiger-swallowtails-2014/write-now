$(function() {
	$('#updateWordCount').on('ajax:success', function(x,json,z, e) {
		var wordsLeft = json[0];
		var timeLeft = json[1];
		var paceNeeded = json[2];
    var percentComplete = json[3];
    $('.wordsLeft').text(wordsLeft);
    $('.timeLeft').text(timeLeft);
    $('.paceNeeded').text(paceNeeded);
    $('.progress .progress-bar').css("width", percentComplete + "%");
    $('#percentComplete').text(percentComplete + "%");
  });
});
