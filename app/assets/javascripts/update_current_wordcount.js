$(function(){
	$('.edit_project').on('ajax:success', function(x,json,z){
		var words_left = json[0]
		var time_left = json[1]
		var pace_needed = json[2]
		$('.wordsLeft').text(words_left);
		$('.timeLeft').text(time_left);
		$('.paceNeeded').text(pace_needed);
	})
});