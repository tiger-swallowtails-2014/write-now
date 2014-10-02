$(document).ready(function() {
	var chart = document.getElementById("chart")
	if (chart != null) {
		alert("Chart exists!")
	  // var context = chart.getContext("2d");
	  // var newChart = new Chart(context).Line(data);
	  // initial_time = {}
	  // draw_chart(initial_time);
	}
});

// if chart div exists, then AJAX to retrieve json, draw entire chart
// on click of update wordcount, same thing